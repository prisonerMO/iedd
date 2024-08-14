#include "script_component.hpp"

[QGVAR(addBombVest), {
	call EFUNC(ied,charge);
}] call CBA_fnc_addEventHandler;
