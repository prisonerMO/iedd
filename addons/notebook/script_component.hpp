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