#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;
if (isServer) then {
	{
		[_x, "Deleted", {(_this select 0) call FUNC(deleted)}, true, [], true] call CBA_fnc_addClassEventHandler;
	} forEach IEDD_CLASSES;
	GVAR(bombs) = [];
};
#include "initSettings.sqf"

ADDON = true;