#include "..\script_component.hpp"
params ["_control"];
private _ctrlCombo = _control controlsGroupCtrl 100;
diag_log format ["pos_onAttributeSAVECtrlCombo: %1, LBSEL: %2",_ctrlCombo, lbCurSel _ctrlCombo];
diag_log format ["pos_onAttributeSAVECtrlCombo: lbsize: %1",lbSize _ctrlCombo];

_ctrlCombo lbData lbCurSel _ctrlCombo;
//missionNamespace setVariable [QGVAR(ctrlCombo), lbCurSel _ctrlCombo]; // same as: StringVariable = "myString";

