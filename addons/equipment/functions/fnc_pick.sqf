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
 * [ace_player, cursorObject, typeOf cursorObject] call iedd_equipment_fnc_pick
 *
 * Public: No
 */

params ["_unit", "_item", "_itemType"];
TRACE_1("fnc_pick",_this);

[player, "PutDown"] call ace_common_fnc_doGesture;
[{
    params ["_unit", "_item", "_itemType"];
    deleteVehicle _item;
    _unit addItem _itemType;
}, [_unit, _item, _itemType], 1.5] call CBA_fnc_waitAndExecute;

