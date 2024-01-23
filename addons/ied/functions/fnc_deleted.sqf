#include "script_component.hpp"
params ["_entity"];
private _attachedObjects = attachedObjects _entity;
{
	_object = _x;
	deleteVehicle _object;
} forEach _attachedObjects;
