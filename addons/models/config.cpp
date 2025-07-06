#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        author = AUTHOR;
        authors[] = {"Prisoner","Lion","Antihilator"};
        name = COMPONENT_NAME;
        units[] = {
            "IEDD_WireStraightRed",
            "IEDD_WireStraightYellow",
            "IEDD_WireStraightGreen",
            "IEDD_WireStraightBlue",
            "IEDD_WireStraightBlack",
            "IEDD_WireThick1Red",
            "IEDD_WireThick1Yellow",
            "IEDD_WireThick1Green",
            "IEDD_WireThick1Blue",
            "IEDD_WireThick1Black",
            "IEDD_WireThick2Red",
            "IEDD_WireThick2Yellow",
            "IEDD_WireThick2Green",
            "IEDD_WireThick2Blue",
            "IEDD_WireThick2Black",
            "IEDD_WireThick3Red",
            "IEDD_WireThick3Yellow",
            "IEDD_WireThick3Green",
            "IEDD_WireThick3Blue",
            "IEDD_WireThick3Black",
            "IEDD_WireTwist1Red",
            "IEDD_WireTwist1Yellow",
            "IEDD_WireTwist1Green",
            "IEDD_WireTwist1Blue",
            "IEDD_WireTwist1Black",
            "IEDD_WireTwist2Red",
            "IEDD_WireTwist2Yellow",
            "IEDD_WireTwist2Green",
            "IEDD_WireTwist2Blue",
            "IEDD_WireTwist2Black",
            "IEDD_WireTwist3Red",
            "IEDD_WireTwist3Yellow",
            "IEDD_WireTwist3Green",
            "IEDD_WireTwist3Blue",
            "IEDD_WireTwist3Black",
            "IEDD_WireTwist4Red",
            "IEDD_WireTwist4Yellow",
            "IEDD_WireTwist4Green",
            "IEDD_WireTwist4Blue",
            "IEDD_WireTwist4Black",
            "IEDD_WireSmallRed",
            "IEDD_WireSmallYellow",
            "IEDD_WireSmallGreen",
            "IEDD_WireSmallBlue",
            "IEDD_WireSmallBlack",
            "IEDD_WireLRed",
            "IEDD_WireLYellow",
            "IEDD_WireLGreen",
            "IEDD_WireLBlue",
            "IEDD_WireLBlack",
            "IEDD_WireCornerRed",
            "IEDD_WireCornerYellow",
            "IEDD_WireCornerGreen",
            "IEDD_WireCornerBlue",
            "IEDD_WireCornerBlack",
            "IEDD_WireCRed",
            "IEDD_WireCYellow",
            "IEDD_WireCGreen",
            "IEDD_WireCBlue",
            "IEDD_WireCBlack",
            "IEDD_Notebook"
            };
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Data_F",
            "iedd_main"
        };
        VERSION_CONFIG;
    };
};
class CfgAddons {
    class PreloadAddons {
        class ADDON {
            list[] = {QUOTE(ADDON)};
        };
    };
};
#include "CfgVehicles.hpp"
