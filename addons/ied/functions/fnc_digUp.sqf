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
    ["_player", objNull, [objNull]],
    ["_helper", objNull, [objNull]],
    ["_ied", objNull, [objNull]],
    ["_step",0],
    ["_pos", [0,0,0]],
    ["_depth",0]
];
TRACE_1("fnc_digUp",_this);
diag_log format ["IEDD: Digging IED %1",_this];
if (isNull _ied) exitWith {"systemChat 'Object is null'";};
if (isNull _helper) exitWith {"systemChat 'Helper is null'";};
if !(ACE_player getVariable [QGVAR(isDigging),false]) exitWith {"systemChat 'someone stopped digging'";};

if (_step < 1) exitWith {
    _pos set [2,0];
    private _bury = _ied getVariable "iedd_ied_bury";
    _bury params ["","_relDir","_relUp",""];
    _ied setPosATL _pos;
    _ied setVectorDirAndUp [_relDir,_relUp];    
    _ied setVariable [QGVAR(isBury),false,true];
    deleteVehicle _helper;
}; // Min depth 5%
_step = _step - 1;
private _finalHeight = _depth * (_step / 20);
private _start = _depth/2;
private _end = _finalHeight - _start;
diag_log format ["IEDD: Digging IED %1, step %2, final height %3, start %4, end %5",_ied,_step,_finalHeight,_start,_end];
private _relDirUp = [vectorDir _ied, vectorUp _ied];
_ied attachTo [_helper, [0,0,_end]];
// _ied setVectorDirAndUp _relDirUp;

[{call FUNC(digUp)},[_helper,_ied,_step,_pos,_depth],1] call CBA_fnc_waitAndExecute;




