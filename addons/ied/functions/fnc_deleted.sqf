#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles deleted event. Deletes all attached objects to an entity.
 *
 * Arguments:
 * 0: The entity to delete the attached objects from <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity] call iedd_ied_fnc_deleted;
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_deleted",_this);

private _attachedObjects = attachedObjects _entity;
{
    _object = _x;
    deleteVehicle _object;
} forEach _attachedObjects;
