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

private _category = ["IEDD", "IEDD", [QPATHTOF(ui\moduleicon.paa)], {}, {GVAR(zenContextMenuEnabled)}] call zen_context_menu_fnc_createAction;
private _categoryPath = [_category, [], 50] call zen_context_menu_fnc_addAction;

private _fnc_hasIed = {_objects findIf {typeOf _x in IEDD_CLASSES} != -1};
private _fnc_onEmptyGround = {isNull _hoveredEntity};

private _placeIed = [
    "PlaceIED",
    localize LSTRING(Zeus_Place_Ied),
    "",
    {[_position] call FUNC(zenOpenPlaceDialog)},
    _fnc_onEmptyGround
] call zen_context_menu_fnc_createAction;
[_placeIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _activateIed = [
    "ActivateIED",
    localize LSTRING(Zeus_Active),
    "",
    {[_objects] call FUNC(zenActivateIed)},
    _fnc_hasIed
] call zen_context_menu_fnc_createAction;
[_activateIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _explodeIed = [
    "ExplodeIED",
    localize LSTRING(Zeus_Explode),
    "",
    {[_objects] call FUNC(zenExplodeIed)},
    _fnc_hasIed
] call zen_context_menu_fnc_createAction;
[_explodeIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _forceDefuseIed = [
    "ForceDefuseIED",
    localize LSTRING(Zeus_ForceDefuse),
    "",
    {[_objects] call FUNC(zenForceDefuseIed)},
    _fnc_hasIed
] call zen_context_menu_fnc_createAction;
[_forceDefuseIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _fnc_hasUnburiedIed = {_objects findIf {(typeOf _x in (IEDD_CLASSES + IEDD_FAKE_CLASSES)) && {!(_x getVariable [QEGVAR(ied,isBury), false])}} != -1};
private _fnc_hasBuriedIed = {_objects findIf {(typeOf _x in (IEDD_CLASSES + IEDD_FAKE_CLASSES)) && {_x getVariable [QEGVAR(ied,isBury), false]}} != -1};

private _buryIed = [
    "BuryIED",
    localize ELSTRING(ied,IsBury),
    "",
    {[_objects] call FUNC(zenOpenBuryDialog)},
    _fnc_hasUnburiedIed
] call zen_context_menu_fnc_createAction;
[_buryIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _digUpIed = [
    "DigUpIED",
    localize ELSTRING(ied,DigUp_DisplayName),
    "",
    {[_objects] call FUNC(zenDigUpIed)},
    _fnc_hasBuriedIed
] call zen_context_menu_fnc_createAction;
[_digUpIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _placeTrainingIed = [
    "PlaceTrainingIED",
    localize LSTRING(Zeus_Place_Training_Ied),
    "",
    {[_position] call FUNC(zenOpenTrainingDialog)},
    _fnc_onEmptyGround
] call zen_context_menu_fnc_createAction;
[_placeTrainingIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _fnc_hasTrainingIed = {_objects findIf {typeOf _x in IEDD_TRAINING_CLASSES} != -1};

private _resetTrainingIed = [
    "ResetTrainingIED",
    localize LSTRING(Zeus_ResetTrainingIED),
    "",
    {},
    _fnc_hasTrainingIed
] call zen_context_menu_fnc_createAction;
private _resetTrainingIedPath = [_resetTrainingIed, _categoryPath, 0] call zen_context_menu_fnc_addAction;

private _resetTrainingRandom = [
    "Random",
    localize ELSTRING(ied,Random_DisplayName),
    "",
    {[_objects, true] call FUNC(zenResetTrainingIed)}
] call zen_context_menu_fnc_createAction;
[_resetTrainingRandom, _resetTrainingIedPath, 0] call zen_context_menu_fnc_addAction;

private _resetTrainingKeep = [
    "Keep",
    localize ELSTRING(ied,Keep_DisplayName),
    "",
    {[_objects, false] call FUNC(zenResetTrainingIed)}
] call zen_context_menu_fnc_createAction;
[_resetTrainingKeep, _resetTrainingIedPath, 0] call zen_context_menu_fnc_addAction;

private _makeSuicideBomber = [
    "MakeSuicideBomber",
    localize LSTRING(Zeus_Suicide),
    "",
    {[_objects] call FUNC(zenOpenSuicideDialog)},
    {_objects findIf {(_x isKindOf "CAManBase") && {alive _x} && {!(_x getVariable [QEGVAR(ied,isCharge), false])}} != -1}
] call zen_context_menu_fnc_createAction;
[_makeSuicideBomber, _categoryPath, 0] call zen_context_menu_fnc_addAction;
