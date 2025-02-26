#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if the player can self interact
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Item <STRING>
 *
 * Return Value:
 * Can Self <BOOLEAN>
 *
 * Example:
 * [ace_player, 'iedd_item_notebook'] call iedd_notebook_fnc_canSelf
 *
 * Public: No
 */

params ["_unit", "_item"];
TRACE_1("fnc_canSelf",_this);

(_item in items _unit &&
{cameraOn == vehicle _unit})