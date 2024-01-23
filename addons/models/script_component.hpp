#define COMPONENT models
#define COMPONENT_NAME "IEDD Models"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_MODELS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MODELS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MODELS
#endif

#include "\x\iedd\addons\main\script_macros.hpp"