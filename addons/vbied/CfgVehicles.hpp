class CBA_Extended_EventHandlers;
class CfgVehicles {
    class ace_zeus_moduleBase;
    class GVAR(zeusModule):ace_zeus_moduleBase {
        scope = 1;
        scopecurator = 2;
        category = QEGVAR(modules,ieds);
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
        displayName = QGVAR(holder);
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                selection = "";
                distance = 2;
                condition = QUOTE(true);
                insertChildren = QUOTE(_this call FUNC(getChildrenActions));
                class IEDD_DisarmMenu {
                    exceptions[] = {"isNotSwimming"};
                    displayName = ECSTRING(ied,Disarm_DisplayName);
                    condition = QUOTE(true); //QUOTE([_player] call EFUNC(ied, canDisarm));
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(disarmActions));
			    };
            };
        };
    };
};

