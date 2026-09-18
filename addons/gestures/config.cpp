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
            "iedd_main",
            "A3_Anims_F", 
            "A3_Anims_F_Config_Sdr"
            };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMovesBasic.hpp"
