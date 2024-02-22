#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Initialize the core/default attributes
#include "initAttributes.sqf"
//#include "initSettings.sqf"

ADDON = true;