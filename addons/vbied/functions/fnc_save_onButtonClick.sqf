#include "..\script_component.hpp"
params ["_ctrl"];
diag_log format ["save_onButtonClick: %1", _this];
private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
private _all = allControls _ctrlGrp;
private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
diag_log format ["save_onButtonClick _all: %1", _all];
diag_log format ["save_onButtonClick iedd_vbied_UserDefined: %1", _ctrls];
private _combo = _all select {ctrlClassName _x == "iedd_vbied_posCombo"};
diag_log format ["save_onButtonClick COMBO: %1", _combo];
{
	private _textGrp = _x;
	for "_i" from 101 to 103 do {
		private _textCtrl = _textGrp controlsGroupCtrl _i;
		private _text = ctrlText _textCtrl;
		diag_log format ["save_onButtonClick: TextCtrl: %1, CtrlText: %2", _textCtrl, _text];
	};
} forEach _ctrls;
{
	private _comboGrp = _x;
	private _ctrlCombo = _comboGrp controlsGroupCtrl 100;
	diag_log format ["save_onButtonClick: COMBOCONTROL: %1",  _ctrlCombo];
	private _current = GVAR(preDefined) get "model";
	private _model = _current select 1;
	private _data = GVAR(userDefined) getOrDefault [_model,[]];
	private _count = count _data;
	private _posName = format ["User Position %1", _count+1];
	_ctrlCombo lbAdd _posName;
	_ctrlCombo lbSetTooltip [_i,"PRE DEFINED "+_posName];
} forEach _combo;