class Land_BarrelEmpty_F;
class GVAR(Barrel_Fake):Land_BarrelEmpty_F {
    scope = 1;
    scopeCurator = 0;
    displayName = CSTRING(Barrel_DisplayName);
    author = AUTHOR;
    editorCategory = "IEDD_MAINCATEGORY";
    editorSubcategory = "IEDD_IEDS";
    class EventHandlers {
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    class ACE_Actions {
        class ACE_MainActions {
            displayName = "$STR_ace_interaction_MainAction";
            selection = "";
            distance = 2;
            condition = QUOTE(!(_target getVariable [ARR_2(QQGVAR(isBury),false)]));//QUOTE(true);
        };
    };
    ace_dragging_canDrag = 1;
    ace_dragging_dragPosition[] = {0, 1, 0};
    ace_dragging_dragDirection = 0;
    ace_dragging_canCarry = 1;
    ace_dragging_carryPosition[] = {0, 0.6, 0};
    ace_dragging_carryDirection = 0;
    ace_cargo_size = 2;
    ace_cargo_canLoad = 1;
    ace_cargo_noRename = 1;
    ace_cargo_blockUnloadCarry = 0;
    iedd_ied_buryDepth[]= {0.528197,0.528197,0.809505};
    iedd_ied_buryDepth3DEN[]= {0.528197,0.528197,0.809505};
};
class GVAR(Barrel_Grey_Fake):GVAR(Barrel_Fake) {
    model = "\A3\Structures_F_EPB\Items\Vessels\BarrelEmpty_grey_F.p3d";
};
class GVAR(Barrel):GVAR(Barrel_Fake) {
    scope = 2;
    scopeCurator = 2;
    class ACE_Actions:ACE_Actions {
        class ACE_MainActions:ACE_MainActions {
            class IEDD_DisarmMenu {
                exceptions[] = {"isNotSwimming"};
                displayName = CSTRING(Disarm_DisplayName);
                condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(ied,bomb),false)] && {[_player] call FUNC(canDisarm)});
                statement = "";
            };
        };
    };
    ace_dragging_canDrag = 1;
    ace_dragging_dragPosition[] = {0, 1, 0};
    ace_dragging_dragDirection = 0;
    ace_dragging_canCarry = 1;
    ace_dragging_carryPosition[] = {0, 0.6, 0};
    ace_dragging_carryDirection = 0;
    ace_cargo_size = 2;
    ace_cargo_canLoad = 1;
    ace_cargo_noRename = 1;
    ace_cargo_blockUnloadCarry = 0;
    iedd_ied_default = QGVAR(Barrel_Fake);
    iedd_ied_buryDepth3DEN[]= {0.784926,0.779376,1.22769};
    iedd_ied_buryPosFix3DEN[]= {-0.1512,-0.1512,-0.1139};
    class Attributes {
        IED_DEFAULT_CATEGORY(EMPTY_CLASS);
        IED_TIMER_CATEGORY;
        IED_BURY_CATEGORY;
    };
};
class GVAR(Barrel_Grey):GVAR(Barrel) {
    displayName = CSTRING(BarrelGrey_DisplayName);
    editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_BarrelEmpty_grey_F.jpg";
    model = "\A3\Structures_F_EPB\Items\Vessels\BarrelEmpty_grey_F.p3d";
    iedd_ied_default = QGVAR(Barrel_Grey_Fake);
};
class GVAR(Training_Barrel):GVAR(Barrel) {
    displayName = CSTRING(Training_Barrel_DisplayName);
    editorSubcategory = "IEDD_TRAINING_IEDS";
    class ACE_Actions : ACE_Actions {
        class ACE_MainActions : ACE_MainActions {
            displayName = "$STR_ace_interaction_MainAction";
            selection = "";
            distance = 2;
            condition = QUOTE(true);
            class IEDD_ResetMenu {
                exceptions[] = {"isNotSwimming"};
                displayName = CSTRING(Reset_DisplayName);
                condition = QUOTE(true);
                insertChildren = QUOTE(_this call FUNC(getTrainingActions));
            };
        };
    };
};

class GVAR(Training_Barrel_Grey):GVAR(Training_Barrel) {
    displayName = CSTRING(Training_BarrelGrey_DisplayName);
};
