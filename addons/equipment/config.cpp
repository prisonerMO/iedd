#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {
			"iedd_equipment_Base",
			"iedd_equipment_Box",
            "iedd_item_Base",
			"iedd_item_Notebook",
			"iedd_equipment_mine"
        };
		weapons[] = {
			"iedd_item_notebook"
		};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Characters_F",
            "A3_Supplies_F_Exp_Ammoboxes",
			"ace_main"
        };
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
