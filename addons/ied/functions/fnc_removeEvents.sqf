#include "..\script_component.hpp"
params ["_unit"];

[_unit, "forceWalk", QGVAR(charge), false] call ace_common_fnc_statusEffect_set;

private _getInManEhId = _unit getVariable [QGVAR(GetInManEhId), -1];
if (_getInManEhId != -1) then {
    _unit removeEventHandler ["GetInMan", _getInManEhId];
    _unit setVariable [QGVAR(GetInManEhId),-1];
};

private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit removeEventHandler ["Killed", _killedEhId];
    _unit setVariable [QGVAR(KilledEhId),-1];
};

private _isCharge = _unit getVariable [QGVAR(isCharge),false];
if (_isCharge) then {
    _unit setVariable [QGVAR(isCharge),nil,true];
};

private _isSuicide = _unit getVariable [QGVAR(isSuicide),false];
if (_isSuicide) then {
	_unit setVariable [QGVAR(suicideWP), nil,true];
};