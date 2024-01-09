#define COMPONENT notebook
#define COMPONENT_NAME "IEDD Notebook"
#include "\x\iedd\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_NOTEBOOK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NOTEBOOK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NOTEBOOK
#endif

#include "\x\iedd\addons\main\script_macros.hpp"
