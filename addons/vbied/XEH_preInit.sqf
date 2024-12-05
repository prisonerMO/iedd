#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;
if (isServer) then {
	[QGVAR(box), "Deleted", {(_this select 0) call EFUNC(ied,deleted)}, true, [], true] call CBA_fnc_addClassEventHandler;
	GVAR(bombs) = [];
};
GVAR(userDefined) = profileNamespace getVariable [QGVAR(userDefined), createHashMap];
//if (isNil QGVAR(userDefined)) then {GVAR(userDefined) = createHashMap}; //TODO PROFILE NAMESPACE SETUP
if (isNil QGVAR(preDefined)) then {GVAR(preDefined) = createHashMap};
{
	_x call FUNC(preDefined);
} forEach VBIED_PREDEFINED;

#include "initSettings.inc.sqf"
ADDON = true;
