#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Sets the speed dial for the UI.
 *
 * Arguments:
 * 0: Whether to increase or decrease speed dial index <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * 1 call ace_explosives_fnc_setSpeedDial; // increase
 * -1 call ace_explosives_fnc_setSpeedDial; // decrease
 *
 * Public: No
 */

params ["_set"];

private _speedDial = ACE_player getVariable [QGVAR(speedDial), []];
private _count = count _speedDial;

if (_count == 0) exitWith {};

GVAR(currentSpeedDial) = (GVAR(currentSpeedDial) + _set + _count) % _count;

ctrlSetText [96301, (_speedDial select GVAR(currentSpeedDial)) select 0];
ctrlSetText [96303, (_speedDial select GVAR(currentSpeedDial)) select 1];
