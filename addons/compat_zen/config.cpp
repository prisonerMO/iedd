#include "script_component.hpp"
class CfgPatches 
{
	class ADDON
	{
		author = AUTHOR;
		authors[] = AUTHORS;
		name = COMPONENT_NAME;
		units[]=
		{
			
		};
		weapons[] = {};
		requiredVersion = REQUIRED_VERSION;
		requiredAddons[] =
		{
			"zen_main",
			"zen_context_actions",
			"ace_interaction",
			"ace_zeus"
		};
		url = "https://community.bistudio.com/wiki";
		VERSION_CONFIG;
        skipWhenMissingDependencies = 1;
	};
};
#include "CfgEventHandlers.hpp"
#include "CfgContext.hpp"