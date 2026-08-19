#include "..\script_component.hpp"
/*
 * Author: IEDD
 * ZEN context menu statement: marks the selected/hovered IED(s) as defused,
 * skipping the wire-cutting sequence. See EFUNC(ied,forceDefuse).
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

private _matched = _objects select {typeOf _x in IEDD_CLASSES};
if (_matched isEqualTo []) exitWith {};

[QEGVAR(ied,forceDefuse), [_matched, player]] call CBA_fnc_serverEvent;
