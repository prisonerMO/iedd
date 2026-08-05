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
if (isNull _ied) exitWith {};
if (isNull _helper) exitWith {};
if (_helper getVariable [QGVAR(isDigging),false]) exitWith {};
_helper setVariable [QGVAR(isDigging),true,true];
private _bury = _ied getVariable [QGVAR(bury),[0,[0,0,0],[0,0,0],0,[0,0,0]]];
_bury params ["_step","_relDir","_relUp","_vector","_pos"];
private _digTime = [iedd_ied_digTime, iedd_ied_digTimeEOD] select ([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist");
private _digTimeLeft = _digTime * (_step / 20);
if (_digTimeLeft < 1) then {
    _digTimeLeft = 1;
};
private _stepTime = _digTimeLeft / _step;
TRACE_5("Continue Digging IED",_ied,_step,_digTime,_digTimeLeft,_stepTime);
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
    _helper setVariable [QGVAR(isDigging), false, true];
    // Reset animation
    [_unit, "", 1] call ace_common_fnc_doAnimation;
};
// condition 
private _fnc_perframeCheck = {
    params ["_args", "_elapsedTime", "_totalTime"];
    _args params ["_unit"];
    if (_totalTime != 0 && {animationState _unit != "AinvPknlMstpSnonWnonDnon_medic4"}) then {
        [_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation;
    };
    if (GVAR(isEntrenchingTool)) then {
        (_unit call ace_trenches_fnc_hasEntrenchingTool)
    } else {
        true;
    };
};


[
    (_digTimeLeft + 0.5),
    _this,
    _fnc_onFinish,
    _fnc_onFailure,
    LLSTRING(Digging_DisplayName),
    _fnc_perframeCheck
] call ace_common_fnc_progressBar;

[{call FUNC(digUp)},[_unit,_helper,_ied,_step,_vector,_stepTime],_stepTime] call CBA_fnc_waitAndExecute;

[_unit, "AinvPknlMstpSnonWnonDnon_medic4"] call ace_common_fnc_doAnimation; //TO-DO loop animation (HOW?)


//[{call FUNC(digUp)},[_unit,_helper,_ied,_step,_pos,_vector],1] call CBA_fnc_waitAndExecute;
// _step = _step - 1;
// private _finalHeight = _vector * (_step / 20);
// private _start = _vector/2;
// private _end = _finalHeight - _start;
// private _relDirUp = [vectorDir _ied, vectorUp _ied];
// _ied attachTo [_helper, [0,0,_end]];
// _ied setVectorDirAndUp _relDirUp;
