#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Opens the ZEN "Spawn Training IED" parameter dialog for the given position.
 * Training IEDs are non-lethal - failed disarms pop a smoke instead of exploding.
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

private _types = call FUNC(zenTrainingIedTypes);
private _typeValues = _types apply {_x select 0};
private _typeLabels = _types apply {_x select 1};

[
    localize LSTRING(Zeus_Place_Training_Ied),
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
        ]]
    ],
    FUNC(zenConfirmTraining),
    {},
    _position
] call zen_dialog_fnc_create;
