class Land_CanisterFuel_F;
class GVAR(CanisterFuel):Land_CanisterFuel_F {
    displayName = CSTRING(FuelCanister_DisplayName);
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
			condition =  QUOTE(_target getVariable [ARR_2(QQGVAR(bury),-1)] == -1);
			class IEDD_DisarmMenu {
				exceptions[] = {"isNotSwimming"};
				displayName = CSTRING(Disarm_DisplayName);
				condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(ied,bomb),false)] && {[_player] call FUNC(canDisarm) && {_target animationPhase 'bucketlid_hide' == 1}});
				statement = "";
			};
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
		class GVAR(Dig) {
			displayName = "$STR_ace_interaction_MainAction";
			selection = "";
			distance = 2;
			condition = QUOTE(_target getVariable [ARR_2(QQGVAR(bury),-1)] > -1);
			insertChildren = QUOTE(_this call FUNC(getDigActions));
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
    iedd_ied_default = "Land_CanisterFuel_F";
    iedd_ied_buryDepth = 0.0055;
    class Attributes {
        class GVAR(ied_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
            displayName = CSTRING(IED_Category);
        };
        class GVAR(color) {
            displayName = CSTRING(Color);
            tooltip = CSTRING(Color_Tooltip);
            property = QGVAR(color);
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultColor);
            control = "Combo";
            typeName = "STRING";
            class Values {
                class 1	{
                    name = CSTRING(Name_Green);
                    value = "green";
                };
                class 2	{
                    name = CSTRING(Name_Blue);
                    value = "Blue";
                };
                class 3	{
                    name = CSTRING(Name_Red);
                    value = "red";
                };
                class 4	{
                    name = CSTRING(Name_White);
                    value = "White";
                };
                class 5 {
                    name = CSTRING(Name_Random);
                    value = "random";
                };
            };
        };
        class GVAR(variation) {
            displayName = CSTRING(Variation);
            tooltip = CSTRING(Variation_Tooltip);
            property = QGVAR(variation);
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultVariation);
            control = "Combo";
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = CSTRING(Variation_1);
                    value = 0;
                };
                class 2	{
                    name = CSTRING(Variation_2);
                    value = 1;
                };
                class 3	{
                    name = CSTRING(Variation_3);
                    value = 2;
                };
                class 4	{
                    name = CSTRING(Variation_4);
                    value = 3;
                };
                class 5	{
                    name = CSTRING(Variation_5);
                    value = 4;
                };
                class 6 {
                    name = CSTRING(Variation_X);
                    value = 5;
                };
                class 7 {
                    name = CSTRING(Name_Random);
                    value = 6;
                };
            };
        };
        class GVAR(varX) {
            displayName = CSTRING(VarX);
            tooltip = CSTRING(VarX_Tooltip);
            property = QGVAR(varX);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultVarX);
        };
        class GVAR(size) {
            displayName = CSTRING(Size);
            tooltip = CSTRING(Size_Tooltip);
            property = QGVAR(size);
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultSize);
            control = "Combo";
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = CSTRING(Name_Tiny);
                    value = 0;
                };
                class 2	{
                    name = CSTRING(Name_Small);
                    value = 1;
                };
                class 3	{
                    name = CSTRING(Name_Medium);
                    value = 2;
                };
                class 4	{
                    name = CSTRING(Name_Large);
                    value = 3;
                };
                class 5 {
                    name = CSTRING(Name_Huge);
                    value = 4;
                };
                class 6 {
                    name = CSTRING(Name_Random);
                    value = 5;
                };
            };
        };
        class GVAR(decals) {
            displayName = CSTRING(Decals);
            tooltip = CSTRING(Decals_Tooltip);
            property = QGVAR(decals);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultDecals);
            typeName = "BOOL";
        };
        class GVAR(dir) {
            displayName = CSTRING(Dir);
            tooltip = CSTRING(Dir_Tooltip);
            property = QGVAR(dir);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultDirection);
            typeName = "BOOL";
        };
        class GVAR(dud) {
            displayName = CSTRING(Dud);
            tooltip = CSTRING(Dud_Tooltip);
            property = QGVAR(dud);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultDud);
        };
        class GVAR(fake) {
            displayName = CSTRING(Fake);
            tooltip = CSTRING(Fake_Tooltip);
            property = QGVAR(fake);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultFake);
        };
        class GVAR(distance) {
            displayName = CSTRING(Distance);
            tooltip = CSTRING(Distance_Tooltip);
            property = QGVAR(distance);
            expression = "_this setVariable ['%s',_value];";
            control = QGVAR(distanceSlider);
            typeName = "NUMBER";
            defaultValue = "0";
        };
        class GVAR(timer_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
            displayName = CSTRING(Timer_Category);
        };
        class GVAR(timer) {
            displayName = CSTRING(Timer);
            tooltip = CSTRING(Timer_Tooltip);
            property = QGVAR(timer);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultTimer);
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = CSTRING(Name_Disabled);
                    value = 0;
                };
                class 2	{
                    name = CSTRING(Name_Enabled);
                    value = 1;
                };
                class 3	{
                    name = CSTRING(Name_Random);
                    value = 2;
                };
            };
        };
        class GVAR(timerValue) {
            displayName = CSTRING(TimerValue);
            tooltip = CSTRING(TimerValue_Tooltip);
            property = QGVAR(timerValue);
            control = QGVAR(timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultTimerValue);
            typeName = "NUMBER";
        };
        class GVAR(randomTimer) {
            displayName = CSTRING(RandomTimer);
            tooltip = CSTRING(RandomTimer_Tooltip);
            property = QGVAR(randomTimer);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultRandomTimer);
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = CSTRING(Name_Disabled);
                    value = 0;
                };
                class 2	{
                    name = CSTRING(Name_Enabled);
                    value = 1;
                };
                class 3	{
                    name = CSTRING(Name_Random);
                    value = 2;
                };
            };
        };
        class GVAR(randomTimerMin) {
            displayName = CSTRING(RandomTimerMin);
            tooltip = CSTRING(RandomTimerMin_Tooltip);
            property = QGVAR(randomTimerMin);
            control = QGVAR(timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultTimerMin);
            typeName = "NUMBER";
        };
        class GVAR(randomTimerMax) {
            displayName = CSTRING(RandomTimerMax);
            tooltip = CSTRING(RandomTimerMax_Tooltip);
            property = QGVAR(randomTimerMax);
            control = QGVAR(timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultTimerMax);
            typeName = "NUMBER";
        };
        class GVAR(bury_SubCategory) {
			data = "AttributeSystemSubcategory";
			control = "SubCategory";
			displayName = "Bury IED";//CSTRING(Bury_Category);
		};
		class GVAR(bury) {
			displayName = CSTRING(Bury_displayName);
			tooltip = CSTRING(Bury_Tooltip);
			property = QGVAR(bury);
			control = QGVAR(burySlider); //If we dont need change anything then "Slider";
			expression = QUOTE(if (is3DEN) then {[ARR_2(_this,parseNumber(_value toFixed 2))] call FUNC(buryIED)} else {_this setVariable [ARR_2('%s',parseNumber(_value toFixed 2))]});//QUOTE(if (isServer && _value > 0.045) then {_this enableSimulation false; ARR_2([_this,_value] call FUNC(buryIED)}));
			defaultValue = 0;
		};
    };
};
class GVAR(Training_CanisterFuel):GVAR(CanisterFuel) {
    displayName = CSTRING(Training_FuelCanister_DisplayName);
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
