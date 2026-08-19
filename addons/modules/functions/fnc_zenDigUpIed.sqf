#include "..\script_component.hpp"
/*
 * Author: IEDD
 * ZEN context menu statement: digs up (unburies) the selected/hovered, buried IED(s).
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

private _matched = _objects select {
    (typeOf _x in (IEDD_CLASSES + IEDD_FAKE_CLASSES)) &&
    {_x getVariable [QEGVAR(ied,isBury), false]}
};
if (_matched isEqualTo []) exitWith {};

[QEGVAR(ied,setBury), [_matched, 0]] call CBA_fnc_serverEvent;
