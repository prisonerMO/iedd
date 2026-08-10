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
 * [helper] call iedd_ied_fnc_deleted_helper;
 *
 * Public: No
 */

params ["_entity"];
TRACE_1("fnc_deleted_helper",_this);

private _attachedObjects = attachedObjects _entity;
private _index = IEDD_CLASSES+IEDD_FAKE_CLASSES findIf {typeOf _entity == _x};
if (_index == -1) then {
    private _object = _attachedObjects select 0;
    private _isBury = _object getVariable [QGVAR(isBury),false];
    if (_isBury) then {
        deleteVehicle _object;
    };
};
