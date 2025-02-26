#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles deleted event. Deletes all attached objects to an entity.
 * If the object is attached to a vehicle, deletes events from the vehicle.
 *
 * Arguments:
 * 0: The entity to delete the attached objects from <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity] call iedd_vbied_fnc_deleted;
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_deleted",_this);

private _vehicle = attachedTo _entity;
if (!isNull _vehicle) then {
	[QGVAR(events), [_vehicle]] call CBA_fnc_serverEvent;
};
private _attachedObjects = attachedObjects _entity;
{
	_object = _x;
	deleteVehicle _object;
} forEach _attachedObjects;
