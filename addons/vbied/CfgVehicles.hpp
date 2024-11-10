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
    class GVAR(box): GVAR(helper) {
        author=AUTHOR;
		/*_generalMacro="";
		scope = 0;
		scopeCurator = 0;
		scopeArsenal = 0;
		editorCategory = "IEDD_MAINCATEGORY";
		editorSubcategory = "IEDD_ITEMS";
		vehicleClass = "IEDD_ITEMS";*/
		displayName="VBIED Box";
        //simulation = "thingX";
        //destrType = "DestructNo";
		//picture="\A3\Weapons_F_Enoch\Items\data\ui\gear_ChemicalDetector_01_CA.paa";
		model="\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d";
        useAction = 0;
        ace_dragging_canDrag = 0;
		ace_dragging_canCarry = 0;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                selection = "";
                distance = 2;
                condition = QUOTE(true);
                class IEDD_DisarmMenu {
                    exceptions[] = {"isNotSwimming"};
                    displayName = ECSTRING(Ied,Disarm_DisplayName);
                    condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(ied,bomb),false)] && {[_player] call EFUNC(ied,canDisarm)});
                    //condition = QUOTE([_player] call EFUNC(ied,canDisarm));
                    statement = "";
                };
                /*insertChildren = QUOTE(_this call FUNC(getChildrenActions));
                class IEDD_DisarmMenu {
                    exceptions[] = {"isNotSwimming"};
                    displayName = ECSTRING(ied,Disarm_DisplayName);
                    condition = QUOTE([_player] call EFUNC(ied,canDisarm));
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(disarmActions));
			    };
                TODO REMOVE BOMB FROM VEHICLE ACTION HERE?
                class IEDD_DisarmMenu {
                    exceptions[] = {"isNotSwimming"};
                    displayName = ECSTRING(ied,Disarm_DisplayName);
                    condition = QUOTE([_player] call EFUNC(ied, canDisarm));
                    statement = "";
                    insertChildren = QUOTE(_this call FUNC(disarmActions));
			    };*/
            };
        };
    };
};

