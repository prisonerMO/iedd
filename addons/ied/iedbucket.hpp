class Land_PlasticBucket_01_closed_F;
class GVAR(Bucket_Fake):Land_PlasticBucket_01_closed_F {
    scope = 1;
    scopeCurator = 0;    
    displayName = CSTRING(Bucket_DisplayName);
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
            class GVAR(open) {
                displayName = CSTRING(Action_Open);
                condition = QUOTE(_target animationPhase 'bucketlid_hide' == 0);
                statement = QUOTE([ARR_3(_target,_player,1)] call FUNC(openCloseBucket));
            };
            class GVAR(close) {
                displayName = CSTRING(Action_Close);
                condition = QUOTE(_target animationPhase 'bucketlid_hide' == 1);
                statement = QUOTE([ARR_3(_target,_player,0)] call FUNC(openCloseBucket));
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
    iedd_ied_buryDepth[] = {0.381293,0.361291,0.447162};
    //iedd_ied_buryDepth3DEN[]= {0.388186,0.398341,0.449231};
};
class GVAR(Bucket):GVAR(Bucket_Fake) {
    scope = 2;
    scopeCurator = 2;
    class ACE_Actions:ACE_Actions {
        class ACE_MainActions:ACE_MainActions {
            class IEDD_DisarmMenu {
                exceptions[] = {"isNotSwimming"};
                displayName = CSTRING(Disarm_DisplayName);
                condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(ied,bomb),false)] && {[_player] call FUNC(canDisarm) && {_target animationPhase 'bucketlid_hide' == 1}});
                statement = "";
            };
        };
    };
    class Attributes {
        IED_DEFAULT_CATEGORY(EMPTY_CLASS);
        /**********BUCKET OPEN / CLOSE ********/
        class GVAR(lidState) {
            displayName = CSTRING(LidState);
            tooltip = CSTRING(LidState_Tooltip);
            property = QGVAR(lidState);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = 0;
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = CSTRING(LidClosed);
                    value = 0;
                };
                class 2	{
                    name = CSTRING(LidOpen);
                    value = 1;
                };
                class 3	{
                    name = CSTRING(Name_Random);
                    value = 2;
                };
            };
        };
        class GVAR(openCloseEOD) {
            displayName = CSTRING(OpenCloseEOD);
            tooltip = CSTRING(OpenCloseEOD_Tooltip);
            property = QGVAR(openCloseEOD);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultOpenCloseEOD);
        };
        class GVAR(openClose) {
            displayName = CSTRING(OpenClose);
            tooltip = CSTRING(OpenClose_Tooltip);
            property = QGVAR(openClose);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultOpenClose);
        };
        IED_TIMER_CATEGORY;
        IED_BURY_CATEGORY;
    };    
};

class GVAR(Training_Bucket):GVAR(Bucket) {
    displayName = CSTRING(Training_Bucket_DisplayName);
    editorSubcategory = "IEDD_TRAINING_IEDS";
    IED_TRAINING_ACTIONS;
};

