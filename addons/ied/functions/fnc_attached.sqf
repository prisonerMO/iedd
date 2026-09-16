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

params ["_object", "_parentObj"];
TRACE_1("fnc_attached",_this);
if (typeOf _parentObj isEqualTo QGVAR(helper)) exitWith {}; //allow ied to be attached to helper
private _var = _object getVariable [QGVAR(movable),false];
private _isBomb = _object getVariable [QGVAR(isBomb),false];
if (_isBomb) then {
    private _var = _object getVariable [QGVAR(movable),false];
    if (!_var) then {
        if (!isNull attachedTo _object) then {
            [QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
        };
    } else {
        private _veh = attachedTo _object;
        if (isNull attachedTo _veh) then {
            [_object, _veh] call FUNC(vehicleCheck);
        };
    }; 
};
