#include "script_component.hpp"
params ["_unit"];


[_unit, "forceWalk", QGVAR(charge), false] call ace_common_fnc_statusEffect_set;	
private _getInMan = _unit getVariable [QGVAR(GetInMan), -1];
if (_getInMan != -1) then {
    _unit removeEventHandler ["Killed", _getInMan];
};
private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit removeEventHandler ["Killed", _killedEhId];
};