#include "..\script_component.hpp"
params ["_entity"];
private _vehicle = attachedTo _entity;
if (!isNull _vehicle) then {
	[QGVAR(events), [_vehicle]] call CBA_fnc_serverEvent;
};
private _attachedObjects = attachedObjects _entity;
{
	_object = _x;
	deleteVehicle _object;
} forEach _attachedObjects;
