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
        };
        //skipWhenAnyAddonPresent[] = {"iedd_zen_compat_main"}; not tested yet, but may cause issues with other mods that use the same modules/rsc, so disabled for now
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};
#include "CfgEventHandlers.hpp"
#include "ui\RscAttributes.hpp"
#include "ACE_zeusActions.hpp"
