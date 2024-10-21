#include "..\script_component.hpp"
params ["_control"];
private _ctrlCombo = _control controlsGroupCtrl 100;
diag_log format ["pos_onAttributeLOAD CtrlCombo: %1",_ctrlCombo];
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
if (_index != -1) then {
	private _data = GVAR(preDefined) get _index;
	private _count = count _data;
	for "_i" from 1 to _count do {
		private _posName = format ["Position %1", _i];
		_ctrlCombo lbAdd _posName;
		_ctrlCombo lbSetTooltip [_i,"PRE DEFINED "+_posName];
	};
};

//HERE GET USER DEFINED LIST!


diag_log format ["pos_onAttributeLOAD CtrlCombo LBSETCUR: %1",lbCurSel _ctrlCombo];
diag_log format ["pos_onAttributeLOAD: lbsize: %1",lbSize _ctrlCombo];

