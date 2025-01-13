#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = {"Prisoner","Lion"};
		name = COMPONENT_NAME;
		units[] = {
            QGVAR(multi)
        };
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Modules_F",
            "A3_Modules_F_Curator",
			"ace_zeus",
            "iedd_main",
            "iedd_vbied"
        };
		url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
	};
	class GVAR(ieds): ADDON {
        units[] = {
            QGVAR(ieds),
			QGVAR(decals),
            QGVAR(activate),
            QGVAR(explode),
            QGVAR(charge),
            QGVAR(suicide),
            QGVAR(vbied),
            QGVAR(activateVbied),
            QGVAR(explodeVbied)
        };
 };

};
class Cfg3DEN
{
    class Attributes
    {
        class Default;
        class TitleWide: Default
        {
            class Controls
            {
                class Title;
            };
        };
        class GVAR(subTitle): TitleWide
        {
            class Controls: Controls
            {
                class Title: Title
                {
                    style = 2;
                    colorText[] = {1,1,1,0.4};
                };
            };
        };
    };
};
#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "UI\zeusModulesRcs.hpp"
#include "CfgVehicles.hpp"

