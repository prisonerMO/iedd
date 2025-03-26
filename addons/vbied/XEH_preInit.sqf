#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;
if (isServer) then {
    [QGVAR(box), "Deleted", {(_this select 0) call FUNC(deleted)}, true, [], true] call CBA_fnc_addClassEventHandler;
    GVAR(bombs) = [];
};
GVAR(userDefined) = profileNamespace getVariable [QGVAR(userDefined), createHashMap];
if (isNil QGVAR(preDefined)) then {GVAR(preDefined) = createHashMap};
{
    _x call FUNC(preDefined);
} forEach VBIED_PREDEFINED;

#include "initSettings.inc.sqf"
ADDON = true;
