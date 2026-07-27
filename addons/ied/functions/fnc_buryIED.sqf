#include "script_component.hpp"
/*
 * Author: Prisoner
 * Bury IED
 *
 *
 * Arguments:
 * 0: IED Object <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [_ied] call iedd_ied_fnc_buryIED;
 *
 * Public: No
 */

params [
    ["_ied",objNull]
];
TRACE_1("fnc_buryIED",_this);

if (isNull _ied) exitWith {"systemChat 'Object is null'";};
private _isBury = _ied getVariable ["iedd_ied_isBury", false];
if !(_isBury) exitWith {diag_log format["IEDD: Bury IED with helper: %1", _isBury];};
private _bury = _ied getVariable [QGVAR(bury), [-1,[0,0,0],[0,0,0]]];
_bury params ["_value","_vectorDir","_vectorUp"];
private _pos = getPosATL _ied;
_pos set [2,0];
diag_log format["IEDD: Bury IED with helper: %1", _bury];
if (_value < 1) exitWith {
    _ied setPosATL _pos;
    _ied setVectorDirAndUp [_vectorDir,_vectorUp];
};
private _configDepth  = _ied getVariable ["iedd_ied_depth",[0,0,0]];
//private _configDepth = getArray (configOf _ied >> "iedd_ied_buryDepth");
_configDepth params ["_sizeX", "_sizeY", "_sizeZ"];
private _vectorF = _vectorDir vectorCrossProduct _vectorUp;
private _vector =(abs (_vectorF #2)) * _sizeX +(abs (_vectorDir #2)) * _sizeY +(abs (_vectorUp #2)) * _sizeZ;
diag_log format ["Burying IED with vectorUP %1, vectorDir %2, _vectorF %3, ied: %4", _vectorUp, _vectorDir, _vectorF, _ied];
diag_log format ["Burying IED with _vector: %1, _value: %2, _configDepth: %3, ied: %4", _vector, _value, _configDepth, _ied];
private _start = _vector/2;
private _vectorEnd = _vector * (_value / 20);
private _end = _start - _vectorEnd;

private _helper = "iedd_ied_helper" createVehicle [0,0,0];
_helper setPosATL _pos;
_helper setVectorUp (surfaceNormal getPosASL _helper);

private _ref = "iedd_ied_helper" createVehicle (getPosASL _helper);
_ref setPosASL (getPosASL _helper);
_ref setVectorDirAndUp [_vectorDir, _vectorUp];
private _relDirUp = [_ref, _helper] call BIS_fnc_vectorDirAndUpRelative;
deleteVehicle _ref;

_ied attachTo [_helper, [0,0,_end]];
_ied setVectorDirAndUp _relDirUp;

_bury set [0, _value];
_bury set [3, _vector];
_ied setVariable [QGVAR(bury),_bury,true];
