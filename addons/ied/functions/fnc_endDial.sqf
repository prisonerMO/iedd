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
 * [ace_player] call iedd_ied_fnc_endDial
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_stopDial",_unit);
if (!alive _unit || {!local _unit}) exitWith {};
if !(_unit getVariable [QGVAR(dialing), false]) exitWith {};
_unit playActionNow QEGVAR(gestures,phone_out);
_unit setVariable [QGVAR(dialing), false];
