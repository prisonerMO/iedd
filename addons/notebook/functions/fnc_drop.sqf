#include "script_component.hpp"
params ["_unit", "_item"];
[player, "PutDown"] call ace_common_fnc_doGesture;
[{
    params ["_unit", "_item"];
    TRACE_2("Dropped:",_unit,_item);
    _weaponHolder = createVehicle ["GroundWeaponHolder", [0,0,0], [], 0, "NONE"];
    _weaponHolder setPosASL getPosASL _unit;
    _weaponHolder addItemCargoGlobal [_item, 1];
	_unit removeItem _item;

}, [_unit, _item], 1.5] call CBA_fnc_waitAndExecute;