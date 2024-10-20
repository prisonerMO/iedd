#include "..\script_component.hpp"
params ["_control","_value"];
diag_log format ["userDefinedSAVE: %1",_this];
[
	parseNumber ctrlText (_control controlsGroupCtrl 101),
	parseNumber ctrlText (_control controlsGroupCtrl 102),
	parseNumber ctrlText (_control controlsGroupCtrl 103)
];