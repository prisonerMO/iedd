#include "script_component.hpp"
params ["_unit"];
private _activate = _unit getVariable [QGVAR(activate),500];
private _explosive = _unit getVariable [QGVAR(explosive),30];
private _isDeadManSwitch = _unit getVariable [QGVAR(isDeadManSwitch),false];
diag_log format ["activate: %1, explosion: %2, isDeadManSwitch: %3",_activate, _explosive, _isDeadManSwitch];
//TRACE_3("Current objects",count GVAR(bombs),time,_checkTime);
//[FUNC(suicide), [], _checkTime] call CBA_fnc_waitAndExecute;


