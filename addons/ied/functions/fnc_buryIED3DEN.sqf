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
private _edenPos = _obj get3DENAttribute "position" select 0;
_edenPos set [2, 0];
_obj set3DENAttribute ["position", _edenPos];
if !(_obj call FUNC(canBuryIED)) exitWith {
    ["IED cannot be buried here", 1] call BIS_fnc_3DENNotification;
    //display red "area" under the object to indicate that it cannot be buried here
    //set values to -1 ?
};

private _pos = _obj modelToWorld [0,0,0];
private _worldPos = _pos #2;
_edenPos set [2, -_worldPos];
_obj set3DENAttribute ["position", _edenPos];
private _vectorDir = vectorDir _obj;
private _vectorUp = vectorUp _obj;
private _configDepth = _obj get3DENAttribute "iedd_ied_depth3DEN" select 0;
//private _configDepth = getArray (configOf _obj >> "iedd_ied_buryDepth");
_configDepth params ["_sizeX", "_sizeY", "_sizeZ"];
private _vectorF = _vectorDir vectorCrossProduct _vectorUp;
private _vector =(abs (_vectorF #2)) * _sizeX +(abs (_vectorDir #2)) * _sizeY +(abs (_vectorUp #2)) * _sizeZ;
private _start = _vector/2 ;
private _vectorEnd = _vector * (_value / 20);
private _end = _start - _vectorEnd;
private _newPos = _edenPos vectorAdd [0, 0, _end];
_obj set3DENAttribute ["position", _newPos];

