#include "script_component.hpp"
class CfgPatches {

    class ADDON {
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {
			"3den",
			"A3_Ui_F",
			"ace_interaction"
        };
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};
#include "CfgEventHandlers.hpp"
#include "ACE_zeusActions.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
#include "UIDefines.hpp"
#include "IEDDEdenMenu.hpp"