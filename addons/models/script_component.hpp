#define COMPONENT models
#define COMPONENT_NAME "IEDD Models"
#include "\x\iedd\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MODELS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MODELS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MODELS
#endif

#include "\x\iedd\addons\main\script_macros.hpp"