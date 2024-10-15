class CBA_Extended_EventHandlers;
class CfgVehicles {
	#include "vbiedmodule.hpp"
    class ace_zeus_moduleBase;
    class GVAR(zeusModule):ace_zeus_moduleBase {
        scope = 1;
        scopecurator = 2;
        category = QEGVAR(modules,ieds);
        _generalMacro = QGVAR(zeusModule);
        curatorInfoType = QGVAR(RcsVbied);
        displayName = "VBIED";
        icon = QPATHTOEF(modules,UI\moduleicon.paa);
    };
};

