#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles save on button click event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control] call iedd_vbied_fnc_save_onButtonClick;
 *
 * Public: No
 */

params ["_ctrl"];
TRACE_1("fnc_save_onButtonClick",_this);

private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrl;
private _all = allControls _ctrlGrp;
private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
_ctrls params ["_one","_two","_three"];
private _pos = [];
private _dir = [];
private _up = [];
private _combo = _all select {ctrlClassName _x == "iedd_vbied_posCombo"};
private _comboGrp =  _combo select 0;
private _ctrlCombo = _comboGrp controlsGroupCtrl 100;
private _editGrp = _all select {ctrlClassName _x == "iedd_vbied_Edit"} select 0;
private _editCtrl = _editGrp controlsGroupCtrl 100;
{
	_x params ["_textGrp","_array"];
	for "_i" from 101 to 103 do {
		private _textCtrl = _textGrp controlsGroupCtrl _i;
		private _text = ctrlText _textCtrl;
		_array pushBack parseNumber _text;
	};
} forEach [[_one,_pos],[_two,_dir],[_three,_up]];

private _current = GVAR(preDefined) get "model";
private _model = _current select 1;
private _data = GVAR(userDefined) getOrDefault [_model,[]];
private _count = count _data;

if (_count > 4) then {
	//TO-DO DISPLAY ERROR
	_display = ctrlParent _ctrl;
	[
		LLSTRING(SaveError),
		"Delete / Modify",
		true,
		false,
		"",
		_display
	] call BIS_fnc_3DENShowMessage;
} else {
	private _text = if (ctrlText _editCtrl == "") then {
		format [LSTRING(User_Defined) + " %1",_count+1];
	} else {
		ctrlText _editCtrl
	};
	private _setCur = lbSize _ctrlCombo;
	_ctrlCombo lbAdd _text;
	_ctrlCombo lbSetTooltip [_setCur,LSTRING(User_Defined_Tooltip)];
	_ctrlCombo lbSetValue [_setCur, _count];
	[_model, _count, _pos, _dir, _up, _text] call FUNC(userDefined);
	_ctrlCombo lbSetCurSel _setCur;
};



