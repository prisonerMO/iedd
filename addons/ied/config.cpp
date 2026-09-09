#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        author = AUTHOR;
        authors[] = {"Prisoner","Lion"};
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(Barrel),
            QGVAR(Barrel_Fake),
            QGVAR(Barrel_Grey),
            QGVAR(Barrel_Grey_Fake),
            QGVAR(Bucket),
            QGVAR(Bucket_Fake),
            QGVAR(CanisterPlastic),
            QGVAR(CanisterPlastic_Fake),
            QGVAR(Cardboard),
            QGVAR(Cardboard_Fake),
            QGVAR(Cinder),
            QGVAR(Cinder_Fake),
            QGVAR(CanisterFuel),
            QGVAR(CanisterFuel_Fake),
            QGVAR(Metal),
            QGVAR(Metal_Fake),
            QGVAR(Metal_English),
            QGVAR(Metal_English_Fake),
            QGVAR(Charge),
            QGVAR(Training_Barrel),
            QGVAR(Training_Barrel_Grey),
            QGVAR(Training_Bucket),
            QGVAR(Training_CanisterPlastic),
            QGVAR(Training_Cardboard),
            QGVAR(Training_Cinder),
            QGVAR(Training_CanisterFuel),
            QGVAR(Training_Metal),
            QGVAR(Training_Metal_English),
            QGVAR(Phone),
        };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Characters_F",            
            "A3_Structures_F_Items_Electronics",
            "A3_Structures_F_Items_Vessels",
            "A3_Props_F_Orange_Humanitarian_Supplies",
            "A3_Props_F_Orange_Civilian_Constructions",
            "A3_Structures_F_EPC_Civ_Garbage",
            "A3_Weapons_F_Explosives",
            "iedd_main"
        };
        url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
    };
};
#include "CfgEventHandlers.hpp"
#include "CfgEden.hpp"
#include "CfgVehicles.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
#include "CfgSounds.hpp"
#include "iedPhoneUI.hpp"
