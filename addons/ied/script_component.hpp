#define COMPONENT ied
#define COMPONENT_NAME "IEDD Handbook - IEDs"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"

//#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_IED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_IED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_IED
#endif

#include "\x\iedd\addons\main\script_macros.hpp"