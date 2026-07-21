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
 * [_ied] call iedd_ied_fnc_buryIED3DEN;
 *
 * Public: No
 */

params [
    ["_obj",objNull],
    ["_value",-1]
];

if (isNull _obj) exitWith {};
private _isBury = _obj get3DENAttribute "iedd_ied_isBury" select 0;
if (!_isBury) exitWith {};
if (_value < 1) exitWith {};
private _pos = _obj get3DENAttribute "position" select 0;
private _vectorDir = vectorDir _obj;
private _vectorUp = vectorUp _obj;

//private _depth = getArray (configOf _obj >> "iedd_ied_buryDepth3DEN");
private _depth = _obj get3DENAttribute "iedd_ied_depth3DEN" select 0;

private _xv = abs(_vectorUp #0);
private _yv = abs(_vectorUp #1);
private _zv = abs(_vectorUp #2);
private _max = selectMax [_xv,_yv,_zv];
private _vector = switch (_max) do {
    case _xv: { 
        [format ["IEDD: Bury IED EDEN: X FACE=%1",_depth select 0], 0] call BIS_fnc_3DENNotification;
        _depth select 0 
    };
    case _yv: { 
        [format ["IEDD: Bury IED EDEN: Y SIDE=%1",_depth select 1], 0] call BIS_fnc_3DENNotification;
        _depth select 1 
    };
    case _zv: { 
        [format ["IEDD: Bury IED EDEN: Z NORMAL=%1",_depth select 2], 0] call BIS_fnc_3DENNotification;
        _depth select 2 
    };
};
// private _bc = boundingCenter _obj select 2;
// private _bb = boundingBoxReal _obj;
// private _min = _bb#0;
// private _max = _bb#1;
// private _size = _max vectorDiff _min;
// private _bbg = boundingBoxReal [_obj, "Geometry"];
// private _ming = _bbg#0 vectorAdd _min vectorMultiply 0.5;
// private _maxg = _bbg#1 vectorAdd _max vectorMultiply 0.5;
// private _sizeg = _maxg vectorDiff _ming;
// private _p1g = _obj modelToWorldWorld (_ming);
// private _p2g = _obj modelToWorldWorld (_maxg);
// private _vector = abs ((_p2g#2) - (_p1g#2));

_pos set [2, 0];
_obj set3DENAttribute ["position", _pos];
private _end = _vector* (_value / 20);
diag_log format["IEDD: Bury IED EDEN: depth=%1 value=%2 end=%3",_depth,_value,_end];
//set3DENAttribute
private _newPos = _pos vectorAdd [0, 0, -_end];
_obj set3DENAttribute ["position", _newPos];
