#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isServer) then {
	GVAR(posAndDir) = createHashMapFromArray VBIED_POS_AND_DIR;
};

ADDON = true;
