#include "..\script_component.hpp"
/*
 * Author: IEDD
 * ZEN context menu statement: activates the selected/hovered IED(s), respecting their dud chance.
 * Mirrors fnc_moduleActivate.sqf, retargeted at the ZEN selection instead of an attached logic.
 *
 * Arguments:
 * 0: Objects <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_objects"];

{
    [QEGVAR(ied,explosion), [_x]] call CBA_fnc_serverEvent;
} forEach (_objects select {typeOf _x in IEDD_CLASSES});
