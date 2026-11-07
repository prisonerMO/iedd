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
            "iedd_modules",            
            "iedd_notebook",
        };
        skipWhenAnyAddonPresent[] = {"iedd_zen_compat"};
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};
#include "CfgEventHandlers.hpp"
#include "ui\RscAttributes.hpp"
#include "aceZeusActions.hpp"
