#include "script_component.hpp"
[QGVAR(clientServerEvent), {
	params ["_target","_event"];
	
	_target call _event;
}] call CBA_fnc_addEventHandler;


