#include "../script_component.hpp"
params ["_vehicle"];

private _getIn = _vehicle getVariable [QGVAR(getInEhId), -1];
if (_getIn != -1) then {
    _vehicle removeEventHandler ["GetIn", _getInManEhId];
    _vehicle setVariable [QGVAR(getIn),-1];
};

private _engigeOn = _vehicle getVariable [QGVAR(engineOnEhId), -1];
if (_engigeOn != -1) then {
	_vehicle removeEventHandler ["Engine", _engineOnEhId];
	_vehicle setVariable [QGVAR(engineOn),-1];
};
