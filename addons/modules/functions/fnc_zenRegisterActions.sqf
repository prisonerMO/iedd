#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Registers IEDD's actions in Zeus Enhanced's (ZEN) right-click context menu.
 * Only called when ZEN is loaded, see modules_zen\XEH_postInit.sqf.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */

private _category = ["IEDD", "IEDD", [QPATHTOF(ui\moduleicon.paa)]] call zen_context_menu_fnc_createAction;
private _categoryPath = [_category, [], 50] call zen_context_menu_fnc_addAction;

private _placeIed = [
    "PlaceIED",
    localize LSTRING(Zeus_Place_Ied),
    "",
    {[_position] call FUNC(zenOpenPlaceDialog)},
    {GVAR(zenContextMenuEnabled)}
] call zen_context_menu_fnc_createAction;

[_placeIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;
