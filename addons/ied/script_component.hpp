#define COMPONENT ied
#define COMPONENT_NAME "IEDD ieds"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_IED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_IED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_IED
#endif

#include "\x\iedd\addons\main\script_macros.hpp"