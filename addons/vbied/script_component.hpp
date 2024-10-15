#define COMPONENT vbied
#define COMPONENT_NAME "IEDD Vehicle-Borne Improvised Explosive Device"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_VBIED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VBIED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MODULES
#endif

#include "\x\iedd\addons\main\script_macros.hpp"