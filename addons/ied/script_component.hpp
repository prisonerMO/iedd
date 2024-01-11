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

#define IEDD_CLASSES [\
	"iedd_ied_CanisterPlastic",\
	"iedd_ied_CanisterFuel",\
	"iedd_ied_Cardboard",\
	"iedd_ied_Cinder",\
	"iedd_ied_Metal",\
	"iedd_ied_Barrel"\
]