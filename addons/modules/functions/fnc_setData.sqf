#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Set VBIED position data
 *
 * Arguments:
 * 0: Combo box control <CONTROL>
 * 1: Value <NUMBER>
 *
 * Return Value:
 * [<POSITION ARRAY>, <DIRECTION ARRAY>, <UP VECTOR ARRAY>]
 *
 * Structure:
 * POSITION ARRAY: [X, Y, Z] (World position coordinates)
 * DIRECTION ARRAY: [X, Y, Z] (Forward direction vector)
 * UP VECTOR ARRAY: [X, Y, Z] (Upward direction vector)
 *
 * Example return:
 * [[123.45, 678.90, 10.5], [0.98, 0.12, 0.0], [0.0, 0.0, 1.0]]
 *
 * Example:
 * [ctrlCombo, 0] call iedd_modules_fnc_setData
 *
 * Public: No
 */

params ["_ctrlCombo","_value"];
TRACE_1("fnc_setData",_this);

if (_value < 0) exitWith {[]};
private _loc = _value;
private _model = EGVAR(vbied,preDefined) get "model";
private _index = _model select 0;
private _data = EGVAR(vbied,preDefined) getOrDefault [_index,[]];
private _count = count _data;
if (_value > _count-1) then {
    private _userModel = _model select 1;
    _data = EGVAR(vbied,userDefined) get _userModel;
    _loc = _value - _count;
};
private _s = _data get _loc;
private _pos = _s get "pos";
private _dir = _s get "dir";
private _up = _s get "up";
[_pos,_dir,_up]
