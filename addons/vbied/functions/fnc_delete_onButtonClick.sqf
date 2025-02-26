#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles the delete on button click event
 *
 * Arguments:
 * 0: Button <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_button] call iedd_vbied_fnc_delete_onButtonClick;
 *
 * Public: No
 */

params ["_ctrl"];
TRACE_1("fnc_delete_onButtonClick",_this);

private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
private _all = allControls _ctrlGrp;
private _combo = _all select {ctrlClassName _x == "iedd_vbied_posCombo"};
private _comboGrp =  _combo select 0;
private _ctrlCombo = _comboGrp controlsGroupCtrl 100;
private _current = GVAR(preDefined) get "model";
private _model = _current select 1;
private _data = GVAR(userDefined) getOrDefault [_model,[]];
private _count = count _data;
private _lbSize = lbSize _ctrlCombo;
private _preCount =  _lbSize - _count;
private _curSel = lbCurSel _ctrlCombo;
private _userCount = _count - 1;
private _preDef = _preCount - 1;
// TO-DO -> private _result = ["Are you sure?", "Confirm", true, true, ctrlParent _ctrl,true] call BIS_fnc_guiMessage;
if (_curSel > _preDef) then {
	private _userVal = _ctrlCombo lbValue _curSel; // value 0-4
	private _userData = _data get _userVal;
	if (_userVal < _userCount) then { // if data between 0-4 (not last)
		for "_n" from _userVal+1 to _userCount do {
			private _preData = _data get _n;
			_data set [_n-1,_preData];
		};
		_data deleteAt _userCount;  // DELETE DATA 0-4
	} else {
		_data deleteAt _userVal;  // DELETE DATA 0-4
	};
	lbClear _ctrlCombo;
	private _grp = _all select {ctrlIDC _x == 95441} select 0;
	[_grp,0] call FUNC(pos_onAttributeLoad);
};
