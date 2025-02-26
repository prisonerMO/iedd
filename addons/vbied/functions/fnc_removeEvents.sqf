#include "..\script_component.hpp"
params ["_vehicle"];
private _getInEhId = _vehicle getVariable [QGVAR(getInEhId), -1];
if (_getInEhId > -1) then {
    _vehicle removeEventHandler ["GetIn", _getInEhId];
    _vehicle setVariable [QGVAR(getInEhId),-1];
};

private _engineOnEhId = _vehicle getVariable [QGVAR(engineOnEhId), -1];
if (_engineOnEhId > -1) then {
	_vehicle removeEventHandler ["Engine", _engineOnEhId];
	_vehicle setVariable [QGVAR(engineOnEhId),-1];
};
