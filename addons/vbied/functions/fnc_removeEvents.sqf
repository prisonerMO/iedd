#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Remove events from the vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call iedd_vbied_fnc_removeEvents;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_removeEvents",_this);

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
