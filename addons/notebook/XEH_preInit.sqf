#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

if (isNil QGVAR(pages)) then { GVAR(pages) = createHashMap};
GVAR(pages) set ["iedd_tab", "home"];
GVAR(pages) set ["page", 0];
call FUNC(pages);


ADDON = true;
