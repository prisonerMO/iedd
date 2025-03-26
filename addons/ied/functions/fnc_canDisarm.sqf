#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if the player can disarm the IED
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * True <BOOL> - Returns true if the player can disarm the IED.
 *
 * Example:
 * [ace_player] call iedd_ied_fnc_canDisarm;
 *
 * Public: No
 */

params ["_player"];
TRACE_1("fnc_canDisarm",_this);

if (GVAR(isEOD) &&
    {!([_player] call ace_common_fnc_isEOD) &&
    {!(_player getUnitTrait "explosiveSpecialist")}}) exitWith {
    false;
};
if (GVAR(isDefusalKit) &&
    {!("ACE_DefusalKit" in (items _player))}) exitWith {
    false;
};
true;

