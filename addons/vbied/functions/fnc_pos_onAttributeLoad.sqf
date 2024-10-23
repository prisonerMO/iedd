#include "..\script_component.hpp"
params ["_control","_value"];
private _ctrlCombo = _control controlsGroupCtrl 100;
_ctrlCombo lbAdd "NEW USER POS";
_ctrlCombo lbSetTooltip [0,"NEW USER POS"];
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
private _data = GVAR(preDefined) getOrDefault  [_index,[]];
private _count = count _data;
if (_count > 0) then {
	for "_i" from 0 to _count-1 do {
		private _posName = _data get _i get "text";
		_ctrlCombo lbAdd _posName;
		_ctrlCombo lbSetTooltip [_i+1,format ["PRE DEFINED Position %1",_i]];
	};
};

/**HERE GET USER DEFINED LIST**/
private _userModel = _model select 1;
private _userData  = GVAR(userDefined) getOrDefault [_userModel,[]];
private _countUser = count _userData;
if (_countUser > 0) then {
	private _dataCount = _countUser - 1;
	for "_i" from 0 to _dataCount do {
		private _posData = _userData get _i;
		private _userName = _posData get "text";
		private _id = _i+_count+1;
		_ctrlCombo lbAdd _userName;
		_ctrlCombo lbSetTooltip [_id,"User PRE DEFINED "+_userName];
		_ctrlCombo lbSetValue [_id,_i];
	};
};
_ctrlCombo lbSetCurSel _value;
//diag_log format ["pos_onAttributeLOAD CtrlCombo LBSETCUR: %1",lbCurSel _ctrlCombo];
//diag_log format ["pos_onAttributeLOAD: lbsize: %1",lbSize _ctrlCombo];

