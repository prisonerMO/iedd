#include "..\script_component.hpp"
_this spawn {
	params ["_control","_config","_value"];
	disableSerialization;
	((_control controlsGroupCtrl 101) controlsGroupCtrl 102) ctrlSetStructuredText parseText ([getText (_config >> QGVAR(nonAllowed)), getText (_config >> QGVAR(allowed))] select _value);
	private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _control;
	private _all = allControls _ctrlGroup;
	private _controls = _all select {ctrlClassName _x find ["iedd_vbied",0] == 0};
	{
		diag_log format ["%1",ctrlClassName _x];
		_x ctrlEnable _value;
		_x ctrlSetFade ([0.75,0] select _value);
		_x ctrlCommit 0;
	} forEach _controls-[_control];
};