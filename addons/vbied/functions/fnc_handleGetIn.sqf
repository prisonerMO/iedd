#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles get in event. Triggers an explosion if a VBIED is attached to the vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Role <STRING>
 * 2: Unit <OBJECT>
 * 3: Turret <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle, _driver, _unit, _turret] call iedd_vbied_fnc_handleGetIn;
 *
 * Public: No
 */

params ["_vehicle", "_role", "_unit", "_turret"];
TRACE_1("fnc_handleGetIn",_this);

private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(box)};
TRACE_3("GetIn State",_vehicle,_index,_unit);
if (_index > -1) then {
	private _bombObj = _attachedObjects select _index;
	if (isNull _bombObj) exitWith {};
	private _isBomb = _bombObj getVariable [QEGVAR(ied,bomb), false];
	if (!_isBomb) exitWith {};
	[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;
};