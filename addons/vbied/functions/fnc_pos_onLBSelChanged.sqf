#include "..\script_component.hpp"
params ["_control", "_lbCurSel"];
private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _control;
private _all = allControls _ctrlGrp;
private _a = _all select {ctrlClassName _x == "iedd_vbied_SubAllowed"};
//private _ad =
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
if (_index != -1) exitWith {
	private _data = GVAR(preDefined) get _index;
	private _p = ["pos","dir","up"];
	private _s = _data get (format ["Position%1",_lbCurSel]);
	private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
	{
		private _ctrl = _x;
		private _d = _p select _forEachIndex;
		private _kd = _s get _d;
		diag_log format ["_d: %1, _kd: %2",_d,  _kd];
		for "_i" from 101 to 103 do {
			private _text = _kd select _i-101;
			private _textCtrl = _ctrl controlsGroupCtrl _i;
			_textCtrl ctrlSetText format ["%1", _text];
		};
	} forEach _ctrls;
};

private _userModel = _model select 1;
private _data = GVAR(userDefined) getOrDefault [_userModel, ""];
if (_data != "") then {

};