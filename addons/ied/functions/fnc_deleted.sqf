#include "script_component.hpp"
params ["_entity"];
{
	_object = _x;
	deleteVehicle _object;
} forEach attachedObjects _entity;
