#define COMPONENT notebook
#define COMPONENT_NAME "IEDD Notebook"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_NOTEBOOK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NOTEBOOK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NOTEBOOK
#endif

#include "\x\iedd\addons\main\script_macros.hpp"
