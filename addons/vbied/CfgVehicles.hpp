class CBA_Extended_EventHandlers;
class CfgVehicles {
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
    class Item_ChemicalDetector_01_olive_F;
    class GVAR(casing): Item_ChemicalDetector_01_olive_F {
        scope = 1;
        scopeCurator = 0;
        useAction = 0;
        icon = "\a3\Data_F_Enoch\Images\ChemicalDetector_ca";
        displayName = "CASING";
    };
    class ThingX;
    class GVAR(helper): ThingX {
        displayName = QGVAR(helper); // not publicly visible, no stringtable needed
        scope = 1;
        scopeCurator = 1;
        model = "\A3\Weapons_f\empty";
        destrType = "DestructNo";
    };
    class GVAR(holder): GVAR(helper) {
        displayName = QGVAR(helper);
        class ACE_Actions {
            class ACE_MainActions {
                insertChildren = QUOTE(_this call FUNC(getChildrenActions));
                class IEDD_DisarmMenu {
                    exceptions[] = {"isNotSwimming"};
                    displayName = CSTRING(Disarm_DisplayName);
                    condition = QUOTE([_player] call FUNC(canDisarm));
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(disarmActions));
			    };
            };
        };
    };
};

