#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles engine on event. Triggers an explosion if a VBIED is attached to the vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Engine state <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, true] call iedd_vbied_fnc_handleEngineOn;
 *
 * Public: No
 */

params ["_vehicle", "_engineState"];
TRACE_1("fnc_handleEngineOn",_this);

private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(box)};
TRACE_3("Engine State",_vehicle,_index,_engineState);
if (_index > -1) then {
	private _bombObj = _attachedObjects select _index;
	private _isBomb = _bombObj getVariable [QEGVAR(ied,bomb), false];
	if (!_isBomb) exitWith {};
	[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
