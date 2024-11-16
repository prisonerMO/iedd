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

#define VAN 		0
#define VAN_BOX 	1
#define VAN_FUEL 	2
#define KAMAZ 		3
#define KAMAZ_FUEL 	4
#define KAMAZ_BOX 	5

#define VBIED_MODELS [\
	[\
		"van_01_transport_f.p3d"\
	],\
	[\
		"van_01_box_f.p3d"\
	],\
	[\
		"van_01_fuel_f.p3d"\
	],\
	[\
		"truck_02_transport_f.p3d",\
		"truck_02_covered_f.p3d"\
	],\
	[\
		"truck_02_fuel_f.p3d"\
	],\
	[\
		"truck_02_box_f.p3d"\
	]\
]

#define VBIED_PREDEFINED [\
	[VAN, 0, [-0.018,1.325,-1.21], [0,-1,0], [0,0,1], "Front"],\
	[VAN, 1, [0.563,-0.38,-0.989], [0,-1,0], [0,0,1], "Center"],\
	[VAN, 2, [0.39,-2.725,-0.87], [-1,0,0], [0,1,0], "Rear Right"],\
	[VAN, 3, [-0.424,-2.72,-0.88], [1,0,0], [0,1,0], "Rear Left"],\
	[VAN_BOX, 0, [-0.018,1.175,-1.19], [0,-1,0], [0,0,1], "Front"],\
	[VAN_BOX, 1, [0.563,-0.525,-0.989], [0,-1,0], [0,0,1], "Center"],\
	[VAN_BOX, 2, [0.39,-2.87,-0.85], [-1,0,0], [0,1,0], "Rear Right"],\
	[VAN_BOX, 3, [-0.424,-2.87,-0.87], [1,0,0], [0,1,0], "Rear Left"],\
	[VAN_FUEL, 0, [-0.018,1.19,-1.17], [0,-1,0], [0,0,1], "Front"],\
	[VAN_FUEL, 1, [0.34,-0.02,-1.12], [-1,0,0.5], [0,1,0], "Center"],\
	[VAN_FUEL, 2, [0.39,-2.87,-0.9], [-1,0,0], [0,1,0], "Rear Right"],\
	[VAN_FUEL, 3, [-0.424,-2.87,-0.9], [1,0,0], [0,1,0], "Rear Left"],\
	[KAMAZ, 0, [-0.05,2.57,-1.457],	[0,-1,0], [0,0,1], "Front"],\
	[KAMAZ, 1, [0.7,0.515,-1.3], [0,1,0], [0,0,1], "Center Right"],\
	[KAMAZ, 2, [-0.6,0.375,-1.21], 	[0,1,0], [0,0,1], "Center Left"],\
	[KAMAZ, 3, [-0,-2.337,-1.36], [0,0,0], [0,0,0], "Rear"],\
	[KAMAZ_FUEL, 0, [-0.08,2.57,-1.5], [0,-1,0], [0,0,1], "Front"],\
	[KAMAZ_FUEL, 1, [0.7,0.515,-1.3], [0,1,0], [0,0,1], "Center Right"],\
	[KAMAZ_FUEL, 2, [-0.6,0.367,-1.21], [0,1,0], [0,0,1], "Center Left"],\
	[KAMAZ_FUEL, 3,	[-0.03,-2.336,-1.335], [0,0,0], [0,0,0], "Rear"],\
	[KAMAZ_BOX, 0, [-0.075,2.75,-1.49], [0,-1,0], [0,0,1], "Front"],\
	[KAMAZ_BOX, 1, [0.6,0.7,-1.22], [0,1,0], [0,0,1], "Center Right"],\
	[KAMAZ_BOX, 2, [-0.6,0.559,-1.25], [0,1,0], [0,0,1], "Center Left"],\
	[KAMAZ_BOX, 3, [-0.029,-2.154,-1.35], [0,0,0], [0,0,0], "Rear"]\
]

#define VBIED_VARS [\
	[["Red","Green","Yellow","Black","Blue","Black","Red"],    [5,3,1,2,4,0,6]],\
	[["Black","Blue","Yellow","Green","Red","Black","Red"],    [0,1,6,5,3,2,4]],\
	[["Yellow","Green","Black","Blue","Red","Black","Red"],    [4,2,6,1,3,5,0]],\
	[["Yellow","Black","Red","Blue","Green","Black","Red"],    [0,6,2,4,3,5,1]],\
	[["Red","Blue","Black","Yellow","Green","Black","Red"],    [6,4,3,2,1,5,0]]\
]

//localize LSTRING(FrontLeft)