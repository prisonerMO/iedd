#include "script_component.hpp"
params ["_control","_value"];
TRACE_1("Selected",_this);
private _display = ctrlParent _control;
lbClear	_control;

private _model = EGVAR(vbied,preDefined) get "model";
private _index = _model select 0;
private _data = EGVAR(vbied,preDefined) getOrDefault [_index,[]];
private _count = count _data;
if (_count > 0) then {
	for "_i" from 0 to _count-1 do {
		private _posName = _data get _i get "text";
		_control lbAdd _posName;
		_control lbSetValue [_i,_i];
		_control lbSetTooltip [_i,format ["PreDefined Position %1",_i+1]];
	};
};
private _userModel = _model select 1;
private _userData  = EGVAR(vbied,userDefined) getOrDefault [_userModel,[]];
private _countUser = count _userData;
if (_countUser > 0) then {
	private _dataCount = _countUser - 1;
	for "_i" from 0 to _dataCount do {
		private _posData = _userData get _i;
		private _userName = _posData get "text";
		private _id = _i+_count;
		_control lbAdd _userName;
		_control lbSetValue [_id,_id];
		_control lbSetTooltip [_id,format ["UserDefinedPos %1",_i+1]];
	};
};
if (_count+_countUser == 0) then {
    _control lbAdd "NO POSITIONS ON THIS MODEL!";
	_control lbSetValue [0,-1];
	_control lbSetCurSel 0;
};
_control lbSetCurSel _value;
