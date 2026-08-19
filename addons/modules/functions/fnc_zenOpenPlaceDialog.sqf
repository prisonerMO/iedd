#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Opens the ZEN "Spawn IED" parameter dialog for the given position.
 * Confirming the dialog spawns the IED exactly at that position, see fnc_zenConfirmPlaceIed.sqf.
 *
 * Arguments:
 * 0: Position <ARRAY> (ASL, as captured by the ZEN context menu click)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_position"];

private _types = call FUNC(zenIedTypes);
private _typeValues = _types apply {_x select 1};
private _typeLabels = _types apply {_x select 2};

[
    localize LSTRING(Zeus_Place_Ied),
    [
        ["COMBO", [LSTRING(Zeus_Type), LSTRING(Zeus_Type_Tooltip)], [_typeValues, _typeLabels, 0]],
        ["COMBO", [LSTRING(Zeus_Variation), LSTRING(Zeus_Ied_Var_Tooltip)], [
            [0, 1, 2, 3, 4, 5, 6],
            [
                ELSTRING(ied,Variation_1),
                ELSTRING(ied,Variation_2),
                ELSTRING(ied,Variation_3),
                ELSTRING(ied,Variation_4),
                ELSTRING(ied,Variation_5),
                ELSTRING(ied,Variation_X),
                ELSTRING(ied,Name_Random)
            ],
            6
        ]],
        ["COMBO", [LSTRING(Zeus_Size), LSTRING(Zeus_Size_Tooltip)], [
            [0, 1, 2, 3, 4, 5],
            [
                ELSTRING(ied,Name_Tiny),
                ELSTRING(ied,Name_Small),
                ELSTRING(ied,Name_Medium),
                ELSTRING(ied,Name_Large),
                ELSTRING(ied,Name_Huge),
                ELSTRING(ied,Name_Random)
            ],
            3
        ]],
        ["SLIDER:PERCENT", [LSTRING(Zeus_Dud_Category)], [0, 1, 0]],
        ["SLIDER", [LSTRING(Zeus_Distance_Category)], [0, 30, 0]],
        ["COMBO", [LSTRING(Zeus_Timer)], [
            [0, 1, 2],
            [
                ELSTRING(ied,Name_Disabled),
                ELSTRING(ied,Name_Enabled),
                ELSTRING(ied,Name_Random)
            ],
            0
        ]],
        ["SLIDER", [LSTRING(Zeus_TimerValue_Category), LSTRING(Zeus_TimerValue_Tooltip)], [0, 300, (EGVAR(ied,defaultTimerValue))]]
    ],
    FUNC(zenConfirmPlaceIed),
    {},
    _position
] call zen_dialog_fnc_create;
