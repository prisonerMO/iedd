#include "script_component.hpp"
params ["_unit"];

[_unit, "forceWalk", QGVAR(charge), false] call ace_common_fnc_statusEffect_set;

private _getInManEhId = _unit getVariable [QGVAR(GetInManEhId), -1];
if (_getInManEhId != -1) then {
    _unit setVariable [QGVAR(GetInManEhId),nil,true];
};

private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit setVariable [QGVAR(KilledEhId),nil,true];
};

private _isCharge = _unit getVariable [QGVAR(isCharge),false];
if (_isCharge) then {
    _unit setVariable [QGVAR(isCharge),nil,true];
};