#define COMPONENT main
#define COMPONENT_NAME "IEDD Handbook - Main"
#include "script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"

//#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MAIN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MAIN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN
#endif

#include "script_macros.hpp"
