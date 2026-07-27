#include "..\script_component.hpp"
/*
 * Authors: Prisoner
 * Dig up buried IED.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: Some param <ANY>
 * 2: Some other param <ANY>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call iedd_ied_fnc_digUp;
 *
 * Public: No
 */

params [
    ["_unit", objNull, [objNull]],
    ["_helper", objNull, [objNull]],
    ["_ied", objNull, [objNull]]
];
TRACE_1("fnc_digUp",_this);
diag_log format ["IEDD: Digging IED %1",_this];
if (isNull _ied) exitWith {"systemChat 'Object is null'";};
if (isNull _helper) exitWith {"systemChat 'Helper is null'";};
if (_helper getVariable [QGVAR(isDigging),false]) exitWith {"systemChat 'someone stopped digging'";};

_helper setVariable [QGVAR(isDigging),true,true];
private _digTime = [iedd_ied_digTime, iedd_ied_digTimeEOD] select ([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist");
if (_digTime < 1) then {
    _digTime = 1;
};

private _bury = _ied getVariable [QGVAR(bury),[0,[0,0,0],[0,0,0],0,[0,0,0]]];
private _pos = getPosATL _helper;
_bury set [3, _pos];
_bury params ["_step","_relDir","_relUp","_vector","_pos"];
_ied setVariable [QGVAR(bury),_bury,true];
private _digTimeLeft = round(_digTime / _step);
// Create progress bar
private _fnc_onFinish = {
    (_this select 0) params ["_unit","_helper","_ied"];
    if (!isNull _helper) then {
        detach _ied;
        deleteVehicle _helper;
    };
    if (!isNull _ied) then {
        _ied setVariable [QGVAR(isBury),false,true];
        _pos set [2,0];
        private _bury = _ied getVariable "iedd_ied_bury";
        _bury params ["","_relDir","_relUp","","_pos"];
        detach _ied;
        deleteVehicle _helper;
        _ied setPosATL _pos;
        _ied setVectorDirAndUp [_relDir,_relUp];    
        _ied setVariable [QGVAR(isBury),false,true];
    };
    //[QGVAR(finished), [_unit, _ied]] call CBA_fnc_globalEvent; //MAYBE TO-DO
    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
// on failure
private _fnc_onFailure = {
    (_this select 0) params ["_unit","_helper","_ied"];
    _helper setVariable [QGVAR(digging), false, true];
    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
// condition
private _fnc_condition = {
    (_this select 0) params ["_unit","_helper","_ied"];
    if (GVAR(isEntrenchingTool)) then {
        (_unit call ace_trenches_fnc_hasEntrenchingTool)
    } else {
        true //do we need check canDigUp?
    };
};

[(_digTimeLeft + 0.5), _this, _fnc_onFinish, _fnc_onFailure, "DIGGIN UP IEEEDDDD", _fnc_condition] call ace_common_fnc_progressBar;

[_unit,_helper,_ied,_step,_vector] call FUNC(DigUp);

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;


//[{call FUNC(digUp)},[_unit,_helper,_ied,_step,_pos,_vector],1] call CBA_fnc_waitAndExecute;

// _step = _step - 1;
// private _finalHeight = _vector * (_step / 20);
// private _start = _vector/2;
// private _end = _finalHeight - _start;
// diag_log format ["IEDD: Digging IED %1, step %2, final height %3, start %4, end %5",_ied,_step,_finalHeight,_start,_end];
// private _relDirUp = [vectorDir _ied, vectorUp _ied];
// _ied attachTo [_helper, [0,0,_end]];
// _ied setVectorDirAndUp _relDirUp;
