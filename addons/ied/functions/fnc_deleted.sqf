#include "script_component.hpp"
params ["_entity"];
private _attachedObjects = attachedObjects _entity;
diag_log format ["Entity: %1, Delete EH attached objecsts %2", _entity, _attachedObjects];
{
	_object = _x;
	deleteVehicle _object;
} forEach _attachedObjects;
