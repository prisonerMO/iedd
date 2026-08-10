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
 * [_entity] call iedd_ied_fnc_detached;
 *
 * Public: No
 */

params ["_attachedObj", "_parentObj"];
TRACE_1("fnc_detached",_this);
if (typeOf _parentObj isEqualTo QGVAR(helper)) then {
    deleteVehicle _parentObj;
};
