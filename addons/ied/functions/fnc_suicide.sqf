#include "script_component.hpp"
params ["_unit"];
private _getExp = _bombObj getVariable [QGVAR(explosive), 0];
private _explosive = if (_getExp > 0) then {_getExp} else {[GVAR(expMinRange), GVAR(expMaxRange)] call BIS_fnc_randomInt};
_bombObj setVariable [QGVAR(expDist),_activate]; // Or keep on unit

private _getAct = _unit getVariable [QGVAR(activate),0];
private _activate = if (_getAct> 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
_bombObj setVariable [QGVAR(actDist),_activate]; // Or keep on unit

private _isDeadManSwitch = _unit getVariable [QGVAR(isDeadManSwitch),false];
_bombObj setVariable [QGVAR(deadManSwitch),_isDeadManSwitch]; // Or keep on unit

diag_log format ["activate: %1, explosion: %2, isDeadManSwitch: %3",_activate, _explosive, _isDeadManSwitch];



