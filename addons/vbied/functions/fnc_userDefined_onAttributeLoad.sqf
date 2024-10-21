#include "..\script_component.hpp"
params ["_control", "_value"];
diag_log format ["ONLOAD %1", _this];
diag_log format ["dirPosShitFuck, "]
params ["_control", "_value"];
disableSerialization;
diag_log format ["userDefinedLoad ATTRIBUTE: %1",_this];
private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _control;
private _all = allControls _ctrlGroup;
diag_log format ["onListBoxChanged: %1",_all select {ctrlClassName _x == "iedd_vbied_UserDefined"}];
//diag_log format ["_control: %1, _lbCurSel: %2",_control, _lbCurSel];
private _userDefined = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
{
	private _ctrl = _x;
	for "_i" from 101 to 103 do {
		private _textCtrl = _ctrl controlsGroupCtrl _i;
		_textCtrl ctrlSetText format ["%1", _i];
		_textCtrl ctrlCommit 0;
		diag_log format ["userDefined Controls: %1",_ctrl controlsGroupCtrl _i];
	};
} forEach _userDefined;



