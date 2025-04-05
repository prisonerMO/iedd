#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Pick up the item and add it to the player inventory
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, 'iedd_item_notebook'] call iedd_notebook_fnc_pick
 *
 * Public: No
 */

params ["_unit", "_item"];
TRACE_1("fnc_pick",_this);

[player, "PutDown"] call ace_common_fnc_doGesture;
[{
    params ["_unit", "_item"];
       deleteVehicle _item;
    _unit addItem QEGVAR(item,notebook);
}, [_unit, _item], 1.5] call CBA_fnc_waitAndExecute;

