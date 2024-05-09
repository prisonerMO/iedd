#include "script_component.hpp"

[QGVAR(addBombVest), {
	_this call EFUNC(ied,charge);
}] call CBA_fnc_addEventHandler;
