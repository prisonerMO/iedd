#define COMPONENT vbied
#define COMPONENT_NAME "IEDD Handbook - VBIEDs"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"

//#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_VBIED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VBIED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MODULES
#endif

#include "\x\iedd\addons\main\script_macros.hpp"

#include "predefined.hpp"

#define VBIED_VARS [\
    [["Red","Green","Yellow","Black","Blue","Black","Red"],    [5,3,1,2,4,0,6]],\
    [["Black","Blue","Yellow","Green","Red","Black","Red"],    [0,1,6,5,3,2,4]],\
    [["Yellow","Green","Black","Blue","Red","Black","Red"],    [4,2,6,1,3,5,0]],\
    [["Yellow","Black","Red","Blue","Green","Black","Red"],    [0,6,2,4,3,5,1]],\
    [["Red","Blue","Black","Yellow","Green","Black","Red"],    [6,4,3,2,1,5,0]]\
]

//localize LSTRING(FrontLeft)