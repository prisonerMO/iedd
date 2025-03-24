#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handle unconscious event on unit with charge vest
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * Is Unconscious <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, true] iedd_ied_fnc_handleUnconscious
 *
 * Public: No
 */

params ["_unit","_isUnconscious"];
TRACE_1("fnc_handleUnconscious",_this);

if (!local _unit || {!_isUnconscious}) exitWith {}; //Douple check?
private _attachedObjects = attachedObjects _unit;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index > -1) then {
    _unit setDamage 1;
};

