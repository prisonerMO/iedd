#define COMPONENT equipment
#define COMPONENT_NAME "IEDD Equipment"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"

//#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_EQUIPMENT
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_EQUIPMENT
    #define DEBUG_SETTINGS DEBUG_SETTINGS_EQUIPMENT
#endif

#include "\x\iedd\addons\main\script_macros.hpp"