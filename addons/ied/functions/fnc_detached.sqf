#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles deleted event. Deletes all attached objects to an entity.
 *
 * Arguments:
 * 0: The attached object <OBJECT>
 * 1: The parent object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_attachedObj, _parentObj] call iedd_ied_fnc_detached;
 *
 * Public: No
 */

params ["_attachedObj", "_parentObj"];
TRACE_1("fnc_detached",_this);
if (typeOf _parentObj isEqualTo QGVAR(helper)) then {
    deleteVehicle _parentObj;
};
