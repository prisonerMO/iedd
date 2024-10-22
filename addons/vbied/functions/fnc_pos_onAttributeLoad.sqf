#include "..\script_component.hpp"
params ["_control","_value"];
diag_log ["format OnLOAD: %1",_this];
private _ctrlCombo = _control controlsGroupCtrl 100;
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
private _data = GVAR(preDefined) getOrDefault  [_index,[]];
private _count = count _data;
if (_count > 0) then {
	for "_i" from 1 to _count do {
		private _posName = format ["Position %1", _i];
		_ctrlCombo lbAdd _posName;
		_ctrlCombo lbSetTooltip [_i,"PRE DEFINED "+_posName];
	};
};

/**HERE GET USER DEFINED LIST**/
private _userModel = _model select 1;
private _userData  = GVAR(userDefined) getOrDefault [_userModel,[]];
private _countUser = count _userData;
if (_countUser > 0) then {
	for "_i" from 1 to _countUser do {
		private _userName = format ["User Position %1", _i];
		_ctrlCombo lbAdd _userName;
		_ctrlCombo lbSetTooltip [_i+_count,"User PRE DEFINED "+_userName];
	};
};
_ctrlCombo lbSetCurSel _value;
//diag_log format ["pos_onAttributeLOAD CtrlCombo LBSETCUR: %1",lbCurSel _ctrlCombo];
//diag_log format ["pos_onAttributeLOAD: lbsize: %1",lbSize _ctrlCombo];

