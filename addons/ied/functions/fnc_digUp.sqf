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
    ["_ied", objNull, [objNull]],
    ["_step",0],
    ["_vector",0],
    ["_stepTime",1]
];
TRACE_1("fnc_digUp",_this);
if (!alive _unit) exitWith {};
if (isNull _ied) exitWith {};
if (isNull _helper) exitWith {};
if !(_helper getVariable [QGVAR(isDigging),false]) exitWith {};
if (_step < 1) exitWith {};
_step = _step - 1;
private _start = _vector/2;
private _vectorEnd = _vector * (_step / 20);
private _end = _start - _vectorEnd;
TRACE_5("Digging IED",_ied,_step,_vectorEnd,_start,_end);
_ied attachTo [_helper, [0,0,_end]];
private _bury = _ied getVariable [QGVAR(bury),[0,[0,0,0],[0,0,0],0,[0,0,0]]];
_bury set [0,_step];
_ied setVariable [QGVAR(bury),_bury,true];
[{call FUNC(digUp)},[_unit,_helper,_ied,_step,_vector,_stepTime],_stepTime] call CBA_fnc_waitAndExecute;




