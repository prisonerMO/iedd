/** PRE DEFINED positions for VBIEDs **/
#define VAN 			0
#define VAN_BOX 		1
#define VAN_FUEL 		2
#define VAN_2 			3
#define KAMAZ 			4
#define KAMAZ_FUEL 		5
#define KAMAZ_BOX 		6
#define OFFROAD 		7
#define OFF_REP 		8
#define OFF_BOX    		9
#define JEEP 			10
#define HATCHBACK 		11
#define KART 			12
#define QUADBIKE 		13
#define SUV 			14
#define TRACTOR 		15

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
    [VAN_2, 0, [-0.65,3.325,-0.8], [1,0,0.5], [0,1,0], "Front left"],\
    [VAN_2, 1, [0.65,3.325,-0.8], [-1,0,0.5], [0,1,0], "Front right"],\
    [VAN_2, 2, [0.708,-1.15,-0.78], [-1,0,0], [0,1,0], "Rear right"],\
    [VAN_2, 3, [-0.708,-1.15,-0.78], [1,0,0], [0,1,0], "Rear left"],\
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
    [KAMAZ_BOX, 3, [-0.029,-2.154,-1.35], [0,0,0], [0,0,0], "Rear"],\
    [OFFROAD, 0, [-0.282,2.01,-1.05],[1,0,0], [0,1,0], "Front left"],\
    [OFFROAD, 1, [0.21,2.01,-1.05],[-1,0,0],[0,1,0], "Front right"],\
    [OFFROAD, 2, [0.712,-0.7,-0.9],[-1,0,0.17],[0,1,0], "Center"],\
    [OFFROAD, 3, [0,-2.217,-1.07],[0,1,0.35],[0.5,0,0], "Rear"],\
    [OFF_REP, 0, [-0.29,2.01,-1.07], [1,0,0], [0,1,0], "Front left"],\
    [OFF_REP, 1, [0.2,2.01,-1.07], [-1,0,0], [0,1,0], "Front right"],\
    [OFF_REP, 2, [0.701,-0.7,-0.9], [-1,0,0.17],[0,1,0], "Center"],\
    [OFF_REP, 3, [0,-2.217,-1.07], [0,1,0.35], [0.5,0,0], "Rear"],\
    [OFF_BOX, 0, [-0.282,2.15,-1.15], [1,0,0], [0,1,0], "Front left"],\
    [OFF_BOX, 1, [0.21,2.15,-1.15], [-1,0,0], [0,1,0], "Front right"],\
    [OFF_BOX, 2, [0.711,-0.55,-1], [-1,0,0.17], [0,1,0], "Center"],\
    [OFF_BOX, 3, [0,-2.052,-1.17], [0,1,0.35], [0.5,0,0], "Rear"],\
    [JEEP, 0, [-0.485,1.8,-0.63], [1,0,0.15], [0,1,0], "Front left"],\
    [JEEP, 1, [0.397,1.8,-0.63], [-1,0,0.15], [0,1,0], "Front right"],\
    [JEEP, 2, [-0.665,-0.9,-0.585], [1,0,0], [0,1,0], "Rear left"],\
    [JEEP, 3, [0.577,-0.9,-0.585], [-1,0,0], [0,1,0], "Rear right"],\
    [HATCHBACK, 0, [0.07,1.85,-0.985], [0,0,1], [0,-1,0.5], "Front"],\
    [HATCHBACK, 1, [-0.35,-2.23,-0.945], [0,0,1], [1,0,0], "Rear left"],\
    [HATCHBACK, 2, [0.3,-2.23,-0.945], [0,0,1], [-1,0,0], "Rear right"],\
    [KART, 0, [-0.385,-0,-0.93], [-1,0,0], [0,1,0], "Center left"],\
    [KART, 1, [0.49,-0.079,-0.93], [1,0,0], [0,-1,0], "Center right"],\
    [QUADBIKE, 0, [-0.221,-0.2,-0.93], [1,0,0], [-1,0,1], "Center left"],\
    [QUADBIKE, 1, [0.2,-0.2,-0.93], [-1,0,0], [-1,0,1], "Center right"],\
    [SUV, 0, [-0.15,1.7,-1.115], [0,0,1], [0,-1,0], "Front"],\
    [SUV, 1, [-0.45,-0.3,-1.018], [0,0,1], [1,0,0], "Center left"],\
    [SUV, 2, [0.45,-0.3,-1.018], [0,0,1], [-1,0,0], "Center right"],\
    [SUV, 3, [-0.221,-2.2,-1.1], [0,0,1], [0,1,0], "Rear"],\
    [TRACTOR, 0, [0,1.475,-1.13], [0,0,1], [1,0,0], "Front"],\
    [TRACTOR, 1, [0.595,-0.08,-1.058], [0,0,1], [0,-1,0], "Center right"],\
    [TRACTOR, 2, [-0.595,-0.08,-1.058], [0,0,1], [0,-1,0], "Center left"],\
    [TRACTOR, 3, [0.02,-0.9,-1.173], [0,0,1], [0,1,0], "Rear"]\
]
