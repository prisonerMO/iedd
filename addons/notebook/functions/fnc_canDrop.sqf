#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if the player is touching the ground and is not inside a vehicle
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Can Drop <BOOLEAN>
 *
 * Example:
 * [ace_player] call iedd_notebook_fnc_canDrop
 *
 * Public: No
 */

params ["_player"];
TRACE_1("fnc_canDrop",_this);

isTouchingGround _player &&
{isNull objectParent _player}
