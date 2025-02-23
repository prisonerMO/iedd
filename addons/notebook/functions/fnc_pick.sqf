#include "..\script_component.hpp"
params ["_unit", "_item"];
[player, "PutDown"] call ace_common_fnc_doGesture;
[{
    params ["_unit", "_item"];
   	deleteVehicle _item;
	_unit addItem QEGVAR(item,notebook);
}, [_unit, _item], 1.5] call CBA_fnc_waitAndExecute;

