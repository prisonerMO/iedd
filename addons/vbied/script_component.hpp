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

#define VBIED_PREDEFINED [\
	[0,0, [0.002,1.365,-1.22], [0,-1,0], [0,0,1],	"Front Left"],\
	[0,1, [0.633,-0.385,-1.159], [0,-1,0], [0,0,-1], "Center Left"],\
	[0,2, [-0.417,-2.763,-0.9], [1,0,0], 	[0,1,0], "Rear Left"],\
	[1,0, [0.102, 1.3225, -0.53], [0,-1,0], [0, 0, 1], "Front Left"],\
	[1,1, [0.263, -1.203, -1.159], [0,-1,0], [-0, -1, -0], "Center Left"],\
	[1,2, [0.387, -2.0763, -0.954], [1,0,0], [1, 0, -0], "Rear Left"]\
]

#define VBIED_VARS [\
	[["Green","Blue","Yellow","Black","Red","Black","Red"],[5,0,4,1,2,3,6]],\
	[["Black","Blue","Yellow","Red","Green","Black","Red"],[2,4,5,6,1,3,0]],\
	[["Yellow","Red","Blue","Green","Black","Black","Red"],[4,3,6,1,5,0,2]],\
	[["Black","Green","Yellow","Blue","Red","Black","Red"],[6,2,1,0,4,3,5]],\
	[["Red","Black","Green","Blue","Yellow","Black","Red"],[5,4,6,2,3,1,0]]\
]

//localize LSTRING(FrontLeft)