#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isNil QGVAR(userDefined)) then {GVAR(userDefined) = createHashMap}; //TODO PROFILE NAMESPACE SETUP
if (isNil QGVAR(preDefined)) then {GVAR(preDefined) = createHashMap};
{
	_x call FUNC(preDefined);
} forEach VBIED_POS_AND_DIR;
diag_log GVAR(preDefined);
ADDON = true;
