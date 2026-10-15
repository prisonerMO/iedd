#define COMPONENT notebook
#define COMPONENT_NAME "IEDD Notebook - Notebook"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"

//#define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_NOTEBOOK
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_NOTEBOOK
    #define DEBUG_SETTINGS DEBUG_SETTINGS_NOTEBOOK
#endif

#include "\x\iedd\addons\main\script_macros.hpp"

#define NOTEBOOK_IDC_DISPLAY    95400
#define NOTEBOOK_IDC_BG         95401
#define NOTEBOOK_IDC_BACK       95402
#define NOTEBOOK_IDC_PREV       95410
#define NOTEBOOK_IDC_NEXT       95411
#define NOTEBOOK_IDC_HOME       95420
#define NOTEBOOK_IDC_INFO       95421
#define NOTEBOOK_IDC_ABOUT      95422
#define NOTEBOOK_IDC_CAN        95423
#define NOTEBOOK_IDC_JERRY      95424
#define NOTEBOOK_IDC_CD         95425
#define NOTEBOOK_IDC_CINDER     95426
#define NOTEBOOK_IDC_BARREL     95427
#define NOTEBOOK_IDC_METAL      95428
#define NOTEBOOK_IDC_CHARGE     95429
#define NOTEBOOK_IDC_VBIED      95430
#define NOTEBOOK_IDC_BUCKET     95431
#define NOTEBOOK_IDC_EMPTY4     95432
#define NOTEBOOK_IDC_DICT       95433
#define NOTEBOOK_IDC_CRED       95434

#define GET_IMAGES_COUNT(category) __EVAL(count ((addonFiles ['x\iedd\addons\notebook\', '.paa']) select {QUOTE(category) in _x})-1;)
#define GET_MAX_IMAGES_COUNT(category) getNumber(configFile >> QGVAR(display) >> "Controls" >> "iedd_notebook_"+category >> "page_count")
#define CTRL_SET_TEXT(ctrl,category,page) ctrl ctrlSetText format [QPATHTOF(images\%1\%2%3.paa), category, category, page]
#define NOTEBOOK_PAGES ["home","info","about","can","jerry","cardboard","cinder","barrel","metal","charge","vbied","bucket","empty4","dict","cred"]
