#include "..\script_component.hpp"
params ["_control"];
diag_log format ["combo ON LOAD %1", _this];
private _ctrlCombo = _control controlsGroupCtrl 100;
diag_log ["CtrlCombo: %1",_ctrlCombo];

private _name = "NEW DEFINED POSITION";
_ctrlCombo lbAdd _name;
_ctrlCombo lbSetTooltip [0,"USER DEFINED POSITION"];
_ctrlCombo lbSetCurSel 0;

private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
if (_index != -1) then {
	private _data = GVAR(preDefined) get _index;
	private _count = count _data;
	for "_i" from 1 to _count do {
		private _posName = format ["Position %1", _i];
		_ctrlCombo lbAdd _posName;
		_ctrlCombo lbSetTooltip [_i,"PRE DEFINED "+_posName];
		_ctrlCombo lbSetCurSel _i;
	};
};

//HERE GET USER DEFINED LIST!
