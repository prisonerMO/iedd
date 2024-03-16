#define COMPONENT compat_zen
#define COMPONENT_NAME "ZEN - IEDD Compatibility"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_COMPAT_ZEN
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_COMPAT_ZEN
    #define DEBUG_SETTINGS DEBUG_SETTINGS_COMPAT_ZEN
#endif

#include "\x\iedd\addons\main\script_macros.hpp"

#define IEDD_CLASSES [\
	"iedd_ied_CanisterPlastic",\
	"iedd_ied_CanisterFuel",\
	"iedd_ied_Cardboard",\
	"iedd_ied_Cinder",\
	"iedd_ied_Metal",\
	"iedd_ied_Metal_English",\
	"iedd_ied_Barrel",\
	"iedd_ied_Barrel_Grey"\
]