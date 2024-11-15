#include "..\script_component.hpp"
params ["_ctrl"];
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
	systemChat "SLOTS FULL DELETE CONTENT";
	//TO-DO DISPLAY ERROR
/*	_display = ctrlParent _ctrl;
	if (!isNull _display ) then {
		_display spawn {
				[
					"You sure you want to delete",
					"Delete / Modify",
					true,
					false,
					"",
					_this
			] call BIS_fnc_3DENShowMessage;;
			//["Message","Title of the Message"] call BIS_fnc_3DENShowMessage;
		};
	};
*/
} else {
	private _text = if (ctrlText _editCtrl == "") then {
		format ["User Position %1",_count+1];
	} else {
		ctrlText _editCtrl
	};
	private _setCur = lbSize _ctrlCombo;
	_ctrlCombo lbAdd _text;
	_ctrlCombo lbSetTooltip [_setCur,"User Defined Position"];
	_ctrlCombo lbSetValue [_setCur, _count];
	[_model, _count, _pos, _dir, _up, _text] call GVAR(userDefined);
	_ctrlCombo lbSetCurSel _setCur;
};



