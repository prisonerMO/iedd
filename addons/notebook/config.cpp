#include "script_component.hpp"
class CfgPatches {

    class ADDON {
        author = AUTHOR;
        authors[] = {"Prisoner","Lion","Antihilator"};
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "3DEN",
            "A3_Ui_F",
            "ace_interaction",
            "iedd_main",
            "A3_Data_F_Decade_Loadorder"
        };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};
#include "CfgEventHandlers.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "controls.hpp"
#include "notebook.hpp"
#include "edenMenu.hpp"
