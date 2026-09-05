#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        author = AUTHOR;
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Data_F_Decade_Loadorder",
            "cba_main",
            "ace_main"
        };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};
#include "CfgSettings.hpp"
#include "CfgEditorCategories.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgEden.hpp"
