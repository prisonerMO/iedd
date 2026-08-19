#include "..\script_component.hpp"
/*
 * Author: IEDD
 * ZEN context menu statement: force-explodes the selected/hovered IED(s), ignoring dud/timer state.
 * Mirrors fnc_moduleExplode.sqf, retargeted at the ZEN selection instead of an attached logic.
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
    [QGVAR(explode), [_x]] call CBA_fnc_serverEvent;
} forEach (_objects select {typeOf _x in IEDD_CLASSES});
