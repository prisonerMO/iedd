#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles stopping the phone gesture.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call iedd_gestures_fnc_stopDial
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_stopDial",_unit);
if (!alive _unit || {!local _unit}) exitWith {};
if !(_unit getVariable [QEGVAR(ied,dialing), false]) exitWith {};

["ace_common_playActionNow", [_unit, QGVAR(stop)], _unit] call CBA_fnc_targetEvent;
_unit setVariable [QEGVAR(ied,dialing), false];

//TO-DO unconsius evetn, killed event, etc. to stop the phone gesture and detach
