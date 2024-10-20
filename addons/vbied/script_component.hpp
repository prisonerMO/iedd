#define COMPONENT vbied
#define COMPONENT_NAME "IEDD Vehicle-Borne Improvised Explosive Device"
#include "\x\iedd\addons\main\script_mod.hpp"
#include "\x\iedd\addons\main\script_debug.hpp"
#ifdef DEBUG_ENABLED_VBIED
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_VBIED
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MODULES
#endif

#include "\x\iedd\addons\main\script_macros.hpp"

#define VBIED_MODELS [\
	[\
		"van_01_fuel_f.p3d",\
		"van_01_transport_f.p3d",\
		"van_01_box_f.p3d"\
	],\
	[\
		"truck_02_fuel_f.p3d",\
		"truck_02_box_f.p3d"]\
]

#define VBIED_POS_AND_DIR [\
	[0,"Position0",[0.002, 1.325, -0.53],[1, 0.003, -0.002],[0.002, 0, 1]],\
	[0,"Position1",[0.563, -1.003, -1.139],[-0, 0.001, -1],[-0, -1, -0.001]],\
	[0,"Position2",[0.187, -2.763, -0.954],[-0.002, 1, 0.007],[1, 0.002, -0.006]],\
	[1,"Position0",[0.102, 1.3225, -0.53],[1, 0.023, -0.002],[0.202, 0, 1]],\
	[1,"Position1",[0.263, -1.203, -1.159],[-0, 0.0021, -1],[-0, -1, -0.001]],\
	[1,"Position2",[0.387, -2.0763, -0.954],[-0.002, 1, 0.007], [1, 0.502, -0.206]]\
]