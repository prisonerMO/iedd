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
// _worldPos = _ied modelToWorld [0,0,0]; //Need to test
private _pos = getPosATL _ied;
_pos set [2,0];
private _bury = _ied getVariable [QGVAR(bury), [-1,[0,0,0],[0,0,0]]];
_bury params ["_value","_vectorDir","_vectorUp"];
diag_log format["IEDD: Bury IED with helper: %1", _bury];
if (_value < 5) exitWith {
    _ied setPosATL _pos;
    // _ied setPosASL _worldPos;
    _ied setVectorDirAndUp [_vectorDir,_vectorUp];
};
//private _depth = getArray (configOf _ied >> "iedd_ied_buryDepth");
private _depth = _ied getVariable ["iedd_ied_depth",[0,0,0]];
private _xv = abs(_vectorUp #0);
private _yv = abs(_vectorUp #1);
private _zv = abs(_vectorUp #2);
private _max = selectMax [_xv,_yv,_zv];
private _vector = switch (_max) do {
    case _xv: {
        hint format ["IEDD: Bury IED: X FACE=%1",_depth select 0];
        _depth select 0;
    };

    case _yv: {
        hint format ["IEDD: Bury IED: Y SIDE=%1",_depth select 1];
        _depth select 1;
    };
    case _zv: {
        hint format ["IEDD: Bury IED: Z NORMAL=%1",_depth select 2];
        _depth select 2;
    };
};
private _finalHeight = _vector * (_value / 20);
private _start = _vector/2;
private _end = _start - _finalHeight;

private _helper = "iedd_ied_helper" createVehicle [0,0,0];
_helper setPosATL _pos;
// _helper setPosASL _worldPos;
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
