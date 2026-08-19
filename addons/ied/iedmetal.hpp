class Land_GarbageBarrel_01_F;
class GVAR(Metal_Fake):Land_GarbageBarrel_01_F {
    scope = 1;
    scopeCurator = 0;
    displayName = CSTRING(MetalBarrel_DisplayName);
    author = AUTHOR;
    editorCategory = "IEDD_MAINCATEGORY";
    editorSubcategory = "IEDD_IEDS";
    class EventHandlers {
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
    class ACE_Actions {
        class ACE_MainActions {
            selection = "";
            position = "[0,0,0.5]";
            displayName = "$STR_ace_interaction_MainAction";
            distance = 2;
            condition = QUOTE(!(_target getVariable [ARR_2(QQGVAR(isBury),false)]));//QUOTE(true);
        };
    };
    iedd_ied_buryDepth[] = {0.770159,0.771682,1.21519};    
    //iedd_ied_buryDepth3DEN[] = {0.784926,0.779376,1.22769};
};
class GVAR(Metal_English_Fake):GVAR(Metal_Fake) {
    model = "\A3\Structures_F_EPB\Items\Vessels\GarbageBarrel_01_grey_F.p3d";
};
class GVAR(Metal):GVAR(Metal_Fake) {
    scope = 2;
    scopeCurator = 2;
    class EventHandlers {
        class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
    };
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
    iedd_ied_default = QGVAR(Metal_Fake);
    class Attributes {
        IED_DEFAULT_CATEGORY(EMPTY_CLASS);
        IED_TIMER_CATEGORY;
        IED_BURY_CATEGORY;
    };
};

class GVAR(Metal_English):GVAR(Metal) {
    displayName = CSTRING(MetalBarrelEnglish_DisplayName);
    editorPreview = "\A3\EditorPreviews_F_Argo\Data\CfgVehicles\Land_GarbageBarrel_01_english_F.jpg";
    model = "\A3\Structures_F_Argo\Civilian\Garbage\GarbageBarrel_01_english_F.p3d";
    iedd_ied_default = QGVAR(Metal_English_Fake);
};

class GVAR(Training_Metal):GVAR(Metal) {
    displayName = CSTRING(Training_MetalBarrel_DisplayName);
    editorSubcategory = "IEDD_TRAINING_IEDS";
    IED_TRAINING_ACTIONS;
};

class GVAR(Training_Metal_English):GVAR(Training_Metal) {
    displayName = CSTRING(Training_MetalBarrelEnglish_DisplayName);
};
