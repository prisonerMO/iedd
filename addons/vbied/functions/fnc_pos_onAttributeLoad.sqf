#include "..\script_component.hpp"
params ["_control","_config","_value"];
diag_log format ["Pos ATTIBUTETELOADD this_ %1", _this];
private _ctrlCombo = _control controlsGroupCtrl 100;
diag_log ["CtrlCombo: %1",_ctrlCombo];
private _name = "Test Test Pos";
_ctrlCombo lbAdd _name;
_ctrlCombo lbSetTooltip [0,"USER DEFINED POS X"];
_ctrlCombo lbSetCurSel 0;

/*
_this spawn {
	params ["_control","_config","_value"];
	disableSerialization;
	((_control controlsGroupCtrl 101) controlsGroupCtrl 102) ctrlSetStructuredText parseText ([getText (_config >> QGVAR(nonAllowed)), getText (_config >> QGVAR(allowed))] select _value);
	private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _control;
	private _all = allControls _ctrlGroup;
	private _controls = _all select {ctrlClassName _x find ["iedd_vbied",0] == 0};
	{
		diag_log format ["%1",ctrlClassName _x];
		_x ctrlEnable ([false,true] select _value);
		_x ctrlSetFade ([0.75,0] select _value);
		_x ctrlCommit 0;
	} forEach _controls-[_control];
};
*/