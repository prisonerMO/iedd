#include "..\script_component.hpp"
params ["_ctrlCombo","_value"];
TRACE_1("setData",_this);
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
