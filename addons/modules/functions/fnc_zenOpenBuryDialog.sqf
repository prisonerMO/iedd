#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Opens the ZEN "Bury IED" parameter dialog for the selected/hovered, not-yet-buried IED(s).
 * Exposes the same pitch/roll/yaw/depth controls as the interactive Zeus "Bury IED" module,
 * applied in one shot on confirm instead of live-previewed while dragging.
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
    {!(_x getVariable [QEGVAR(ied,isBury), false])} &&
    {_x call EFUNC(ied,canBuryIED)}
};
if (_matched isEqualTo []) exitWith {};

private _reference = _matched select 0;
(_reference call BIS_fnc_getPitchBank) params ["_pitch", "_roll"];
private _yaw = [getDir _reference] call CBA_fnc_simplifyAngle180;

[
    localize ELSTRING(ied,IsBury),
    [
        ["SLIDER", [LSTRING(Pitch)], [-180, 180, _pitch]],
        ["SLIDER", [LSTRING(Roll)], [-180, 180, _roll]],
        ["SLIDER", [LSTRING(Yaw)], [-180, 180, _yaw]],
        ["SLIDER", [LSTRING(Depth)], [0, 20, 10]]
    ],
    FUNC(zenConfirmBury),
    {},
    _matched
] call zen_dialog_fnc_create;
