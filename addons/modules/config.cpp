#include "script_component.hpp"
class CfgPatches {
	class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {
            QGVAR(multi)
        };
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
            "A3_Modules_F",
            "A3_Modules_F_Curator",
			"ace_zeus"
        };
		url = "https://community.bistudio.com/wiki";
        VERSION_CONFIG;
	};
	class GVAR(ieds): ADDON {
        units[] = {
            QGVAR(ieds),
			QGVAR(decals),
            QGVAR(activate),
            QGVAR(explode)
        };
 };

};
class Cfg3DEN
{
    class Attributes // Attribute UI controls are placed in this pre-defined class
    {
        // Base class templates
        class Default; // Empty template with pre-defined width and single line height
        class TitleWide: Default
        {
            class Controls
            {
                class Title;
            };
        }; // Template with full-width single line title and space for content below it

        // Your attribute class
        class GVAR(subTitle): TitleWide
        {
            // List of controls, structure is the same as with any other controls group
            class Controls: Controls
            {
                class Title: Title
                {
                    style = 2;
                    colorText[] = {1,1,1,0.4};
                }; // Inherit existing title control. Text of any control with class Title will be changed to attribute displayName
            };
        };
    };
};
#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "zeusModulesRcs.hpp"
#include "CfgVehicles.hpp"

