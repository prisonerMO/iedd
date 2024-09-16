#include "script_component.hpp"

[QGVAR(addBombVest), {
	call EFUNC(ied,charge);
}] call CBA_fnc_addEventHandler;

[QGVAR(remove), {
	params ["_unit"];
	TRACE_1("removeEvent",_this);
	removeAllWeapons _unit;
	private _vest = vest _unit;
	if (_vest != "") then {
        removeVest _unit;
    };
}] call CBA_fnc_addEventHandler;
