#include "..\script_component.hpp"
params ["_ctrlCombo", "_lbCurSel"];
private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;
private _all = allControls _ctrlGrp;
private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
if (_ctrls isEqualTo []) exitWith {
	_this spawn {
		_this call FUNC(pos_onLBSelChanged);
	};
};
if (_lbCurSel == 0) exitWith {
	{
		for "_i" from 101 to 103 do {
			private _ctrl = _x;
			private _textCtrl = _ctrl controlsGroupCtrl _i;
			_textCtrl ctrlSetText format ["%1", _lbCurSel];
		};
	} forEach _ctrls;
};
diag_log format ["posLBSelCh: %1", _ctrls];
_ctrls params ["_one","_two","_three"];
private _loc = _lbCurSel-1;
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
private _data = GVAR(preDefined) getOrDefault [_index,[]];
private _count = count _data;
diag_log format ["_lb %1, Count %2",_lbCurSel ,_count];
if (_lbCurSel > _count) then {
	private _userModel = _model select 1;
	_data = GVAR(userDefined) get _userModel;
	_loc = _loc - _count;
};
diag_log format ["DATA: %1, _loc: %2",_data,_loc];
private _s = _data get _loc;
{
	_x params ["_ctrl","_d"];
	private _kd = _s get _d;
	diag_log format ["_d: %1, _kd: %2, ctrl: %3", _d,  _kd, _ctrl];
	for "_i" from 101 to 103 do {
		private _text = _kd select _i-101;
		private _textCtrl = _ctrl controlsGroupCtrl _i;
		_textCtrl ctrlSetText format ["%1", _text];
	};
} forEach [[_one,"pos"],[_two,"dir"],[_three,"up"]];
