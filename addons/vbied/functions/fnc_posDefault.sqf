#include "..\script_component.hpp"
params ["_p"];
diag_log format ["POSDEFAULT: %1", _this];
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
if (_index > -1) exitWith {
	private _data = GVAR(preDefined) get _index;
	private _s = _data get "Position1";
	private _kd = _s get _p;
	_kd;
};
private _return = [0.0,0.0,0.0];
private _userModel = _model select 1;
private _data = GVAR(userDefined) getOrDefault [_userModel, ""];
if (_data != "") then {

};
_return