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

if (isNull _ied) exitWith {};
private _isBury = _ied getVariable ["iedd_ied_isBury", false];
if !(_isBury) exitWith {};
private _bury = _ied getVariable [QGVAR(bury), [-1,[0,0,0],[0,0,0]]];
_bury params ["_value","_vectorDir","_vectorUp"];
private _pos = getPosATL _ied;
_pos set [2,0];
TRACE_1("Bury params:",_bury);
if (_value < 1) exitWith {
    _ied setPosATL _pos;
    _ied setVectorDirAndUp [_vectorDir,_vectorUp];
    _ied setVariable [QGVAR(isBury),false,true];
};
private _configDepth = getArray (configOf _ied >> "iedd_ied_buryDepth");
//private _configDepth  = _ied getVariable ["iedd_ied_depth",getArray (configOf _ied >> 'iedd_ied_buryDepth')];
_configDepth params ["_sizeX", "_sizeY", "_sizeZ"];
private _vectorF = _vectorDir vectorCrossProduct _vectorUp;
private _vector =(abs (_vectorF #2)) * _sizeX +(abs (_vectorDir #2)) * _sizeY +(abs (_vectorUp #2)) * _sizeZ;
TRACE_4("IED: Bury IED",_vectorUp,_vectorDir,_vectorF,_ied);
private _start = _vector/2;
private _vectorEnd = _vector * (_value / 20);
private _end = _start - _vectorEnd;

private _helper = QGVAR(helper) createVehicle [0,0,0];
_helper setPosATL _pos;
_helper setVectorUp (surfaceNormal getPosASL _helper);

private _ref = QGVAR(helper) createVehicle [0,0,0];
_ref setPosASL (getPosASL _helper);
_ref setVectorDirAndUp [_vectorDir, _vectorUp];
private _relDirUp = [_ref, _helper] call BIS_fnc_vectorDirAndUpRelative;
deleteVehicle _ref;

_ied attachTo [_helper, [0,0,_end]];
_ied setVectorDirAndUp _relDirUp;

_bury set [0, _value];
_bury set [3, _vector];
_bury set [4, _pos];
TRACE_1("Bury params end:",_bury);
_ied setVariable [QGVAR(bury),_bury,true];
