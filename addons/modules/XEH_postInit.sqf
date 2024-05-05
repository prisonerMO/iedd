#include "script_component.hpp"
[QGVAR(clientServerEvent), {
	params ["_target","_event"];
	
	_target call _event;
}] call CBA_fnc_addEventHandler;

[QGVAR(addIeddVest), {
	_this call EFUNC(ied,charge);
}] call CBA_fnc_addEventHandler;
