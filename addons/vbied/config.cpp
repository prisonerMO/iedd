#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = {"Prisoner","Lion"};
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Modules_F",
            "A3_Modules_F_Curator",
			"ace_zeus",
			"iedd_ied",
            "iedd_main"
        };
		url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgEden.hpp"
