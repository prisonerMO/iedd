#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {
			QGVAR(Barrel),
			QGVAR(Barrel_Grey),
			QGVAR(CanisterPlastic),
			QGVAR(Cardboard),
			QGVAR(Cinder),
			QGVAR(CanisterFuel),
			QGVAR(Metal),
			QGVAR(Metal_English)
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Characters_F",
			"A3_Structures_F_Items_Vessels",
			"A3_Props_F_Orange_Humanitarian_Supplies",
			"A3_Props_F_Orange_Civilian_Constructions",
			"A3_Structures_F_EPC_Civ_Garbage",
			"iedd_main"
        };
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"
