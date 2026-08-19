#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Opens the ZEN "Make Suicide Bomber" parameter dialog for the selected/hovered,
 * eligible unit(s). Mirrors the interactive Zeus "Set Suicide" module's controls.
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
    (_x isKindOf "CAManBase") &&
    {alive _x} &&
    {!(_x getVariable [QEGVAR(ied,isCharge), false])}
};
if (_matched isEqualTo []) exitWith {};

private _reference = _matched select 0;
private _defaultSides = [west, east, independent, civilian] - [side group _reference];

[
    localize LSTRING(Zeus_Suicide),
    [
        ["COMBO", [LSTRING(Zeus_Variation), LSTRING(Zeus_Ied_Var_Tooltip)], [
            [0, 1, 2, 3, 4, 5],
            [
                ELSTRING(ied,Variation_1),
                ELSTRING(ied,Variation_2),
                ELSTRING(ied,Variation_3),
                ELSTRING(ied,Variation_4),
                ELSTRING(ied,Variation_5),
                ELSTRING(ied,Name_Random)
            ],
            5
        ]],
        ["COMBO", [LSTRING(Zeus_Size), LSTRING(Zeus_Size_Tooltip)], [
            [0, 1, 2, 3, 4],
            [
                ELSTRING(ied,Name_Tiny),
                ELSTRING(ied,Name_Small),
                ELSTRING(ied,Name_Medium),
                ELSTRING(ied,Name_Large),
                ELSTRING(ied,Name_Random)
            ],
            2
        ]],
        ["SLIDER:PERCENT", [LSTRING(Zeus_Dud_Category)], [0, 1, 0]],
        ["SLIDER", [LSTRING(Zeus_Act_Category), ELSTRING(ied,DistanceActivate_Tooltip)], [0, 1000, 300]],
        ["SLIDER", [LSTRING(Zeus_Exp_Category), ELSTRING(ied,DistanceExplosion_Tooltip)], [0, 50, 15]],
        ["COMBO", [LSTRING(Zeus_Dms_Category), ELSTRING(ied,isDeadManSwitch_Description)], [
            [0, 1],
            [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled)],
            0
        ]],
        ["SIDES", [LSTRING(Zeus_Sides_Category), ELSTRING(ied,Sides_Description)], _defaultSides]
    ],
    FUNC(zenConfirmSuicide),
    {},
    _matched
] call zen_dialog_fnc_create;
