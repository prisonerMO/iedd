#include "..\script_component.hpp"
params ["_ctrl"];
diag_log format ["save_onButtonClick: %1", _this];
private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
private _all = allControls _ctrlGrp;
private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
_ctrls params ["_one","_two","_three"];
private _pos = [];
private _dir = [];
private _up = [];
diag_log format ["save_onButtonClick _all: %1", _all];
diag_log format ["save_onButtonClick iedd_vbied_UserDefined: %1", _ctrls];
private _combo = _all select {ctrlClassName _x == "iedd_vbied_posCombo"};
diag_log format ["save_onButtonClick COMBO: %1", _combo];
{
	_x params ["_textGrp","_array"];
	diag_log format ["foreach %1, %2",_textGrp, _array];
	//private _textGrp = _x;
	for "_i" from 101 to 103 do {
		private _textCtrl = _textGrp controlsGroupCtrl _i;
		private _text = ctrlText _textCtrl;
		diag_log format ["save_onButtonClick: TextCtrl: %1, CtrlText: %2", _textCtrl, _text];
		_array pushBack parseNumber _text;
	};

} forEach [[_one,_pos],[_two,_dir],[_three,_up]];
diag_log [_pos,_dir,_up];
{
	private _comboGrp = _x;
	private _ctrlCombo = _comboGrp controlsGroupCtrl 100;
	diag_log format ["save_onButtonClick: COMBOCONTROL: %1",  _ctrlCombo];
	private _current = GVAR(preDefined) get "model";
	private _model = _current select 1;
	diag_log format ["save_onButtonClick: _model: %1",_model];
	private _data = iedd_vbied_userDefined getOrDefault [_model,[]];
	diag_log format ["save_onButtonClick: _data: %1",_data];
	private _count = count _data;
	private _lbSize = lbSize _ctrlCombo;
	if (_count > 4) then {
		_count = 0;
		private _reSize = _lbSize-5;
		private _name = format ["Position%1",_count+1];
		[_model,_name,_pos,_dir,_up] call FUNC(userDefined);
		_ctrlCombo lbSetCurSel _reSize;

		//OR exitWith {ERROR , DELETE USER DEFINED FROM LIST.}
	} else {
		private _posName = format ["User Position %1", _count+1];
		_ctrlCombo lbAdd _posName;
		_ctrlCombo lbSetTooltip [_lbSize,"PRE User Position "+_posName];
		private _name = format ["Position%1",_count+1];
		[_model,_name,_pos,_dir,_up] call FUNC(userDefined);
		_ctrlCombo lbSetCurSel _lbSize;
	};

} forEach _combo;
