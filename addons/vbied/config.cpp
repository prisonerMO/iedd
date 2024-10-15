#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = {"Prisoner","Lion"};
		name = COMPONENT_NAME;
		units[] = {
            QGVAR(edenModule)
        };
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Modules_F",
            "A3_Modules_F_Curator",
			"ace_zeus",
            "iedd_main",
            "iedd_modules"
        };
		url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
	};
	class GVAR(vbied): ADDON {
        units[] = {
            QGVAR(zeusModule)
        };
 };

};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

