#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Hide or show charges on unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, true] call iedd_ied_fnc_hideCharges
 *
 * Public: No
 */

params ["_unit","_state"];
private _attachedObjects = attachedObjects _unit;

private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index > -1) then {
    private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
    {
        private _charge = _x;
        private _attachedParts = attachedObjects _charge;
        if (_attachedParts isNotEqualTo []) then {
            {
                private _part = _x;
                private _jipId = [QGVAR(hideObject),[_part,_state]] call CBA_fnc_globalEventJIP;
                [_jipID, _part] call CBA_fnc_removeGlobalEventJIP;
            } forEach _attachedParts;
        };
        private _chargeJipId = [QGVAR(hideObject),[_charge,_state]] call CBA_fnc_globalEventJIP;
        [_chargeJipId, _charge] call CBA_fnc_removeGlobalEventJIP;
    } forEach _charges;
};
