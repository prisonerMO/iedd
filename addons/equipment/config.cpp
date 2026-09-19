#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"Prisoner","Lion"};
        name = COMPONENT_NAME;
        units[] = {
            "iedd_equipment_Box",
            "iedd_item_Base",
            "iedd_item_Notebook",
            "iedd_item_Phone"
        };
        weapons[] = {
            "iedd_item_notebook",
            "iedd_item_phone"        
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Characters_F",
            "A3_Supplies_F_Exp_Ammoboxes",
            "ace_main",
            "iedd_main"
        };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
