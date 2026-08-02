class Land_CinderBlock_01_F;
class GVAR(Cinder_Fake):Land_CinderBlock_01_F {
    scope = 1;
    scopeCurator = 0;
    displayName = CSTRING(Cinder_DisplayName);
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
    iedd_ied_buryDepth[]= {0.171383,0.336744,0.218253};
    // iedd_ied_buryDepth3DEN[]= {0.171383,0.336744,0.218985};
};
class GVAR(Cinder):GVAR(Cinder_Fake) {
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
    iedd_ied_default = QGVAR(Cinder_Fake);
    class Attributes {
        IED_DEFAULT_CATEGORY(EMPTY_CLASS);
        IED_TIMER_CATEGORY;
        IED_BURY_CATEGORY;
    };
};
class GVAR(Training_Cinder):GVAR(Cinder) {
    displayName = CSTRING(Training_Cinder_DisplayName);
    editorSubcategory = "IEDD_TRAINING_IEDS";
    IED_TRAINING_ACTIONS;
};
