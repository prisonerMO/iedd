#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = AUTHOR;
		name = COMPONENT_NAME;
		units[] = {};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] = {"cba_main","ace_common"};
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
	};
};
#include "CfgEditorCategories.hpp"
#include "CfgVehicleClasses.hpp"