#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

GVAR(userDefined) = profileNamespace getVariable [QGVAR(userDefined), createHashMap];
//if (isNil QGVAR(userDefined)) then {GVAR(userDefined) = createHashMap}; //TODO PROFILE NAMESPACE SETUP
if (isNil QGVAR(preDefined)) then {GVAR(preDefined) = createHashMap};
{
	_x call FUNC(preDefined);
} forEach VBIED_PREDEFINED;
diag_log GVAR(preDefined);
diag_log GVAR(userDefined);
ADDON = true;
