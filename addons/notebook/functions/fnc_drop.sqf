#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Drop the item from the player
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player, 'iedd_item_notebook'] call iedd_notebook_fnc_drop
 *
 * Public: No
 */

params ["_unit", "_item"];
TRACE_1("fnc_drop",_this);

[player, "PutDown"] call ace_common_fnc_doGesture;

[{
    params ["_unit", "_item"];
    TRACE_2("Dropped:",_unit,_item);
    _weaponHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "NONE"];
    _weaponHolder setPosASL getPosASL _unit;
    _weaponHolder addItemCargoGlobal [_item, 1];
	_unit removeItem _item;

}, [_unit, _item], 1.5] call CBA_fnc_waitAndExecute;