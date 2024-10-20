#include "..\script_component.hpp"
params ["_p"];
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
if (_index > -1) exitWith {
	private _data = GVAR(preDefined) get _index;
	diag_log format ["posDefault Load DATA: %1",_data];
	private _s = _data get "Position1";
	diag_log format ["posDefault Load S: %1",_s];
	private _kd = _s get _p;
	diag_log format ["posDefault Load S: %1",_kd];
	_kd;
};
private _userModel = _model select 1;
private _data = GVAR(userDefined) getOrDefault [_userModel, ""];
if (_data != "") then {

} else {
	[0.0,0.0,0.0]
};