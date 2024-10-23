#include "..\script_component.hpp"
params ["_ctrl"];
private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
private _all = allControls _ctrlGrp;
private _combo = _all select {ctrlClassName _x == "iedd_vbied_posCombo"};
private _comboGrp =  _combo select 0;
private _ctrlCombo = _comboGrp controlsGroupCtrl 100;
private _current = GVAR(preDefined) get "model";
private _model = _current select 1;
private _data = GVAR(userDefined) getOrDefault [_model,[]];
if (_data isEqualTo []) exitWith {"ERROR MESSAGE HERE"};
private _count = count _data;
private _setCur = lbSize _ctrlCombo - 1;
private _curSel = lbCurSel _ctrlCombo;
private _userCount = _count - 1;
private _userDefined = _setCur - _count;
if (_curSel > _userDefined) then {
	for "_i" from _userCount to _setCur-1 do {
		private _value = _ctrlCombo lbValue _i;
		diag_log format ["FOR I vaaluee %1",_value];
	};
	_ctrlCombo lbDelete _curSel;
	private _userVal = _ctrlCombo lbValue _curSel;
	private _userData = _data get _userVal;
	_data deleteAt _userVal;
	if (_userVal < _userCount) then {
		for "_n" from _userVal+1 to _userCount-1 do {
			diag_log format ["User CUR Data: %1,  n:%2",_data get _n, _n];
			private _preData = _data get _n;
			_data set [_n-1,_preData];
			diag_log format ["User AFTER VALUE: %1",_data get _n];
		};
	};
};
