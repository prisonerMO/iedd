
class iedd_vbied_attributes {
    class Attributes {
        class GVAR(vbiedSub) {
            property = QGVAR(vbiedSub);
            control = QGVAR(SubVbied);
            displayName = CSTRING(vbiedSub);
            defaultValue = "_this call iedd_vbied_fnc_modelDefault";
            condition = "objectVehicle";
        };
        class GVAR(isVbied) {
            property = QGVAR(isVbied);
            control = "CheckboxState";
            displayName = CSTRING(AddVbied);
            tooltip = CSTRING(AddVbied_Tooltip);
            expression = QUOTE(if (_value) then {[ARR_2(_this,true)] call FUNC(prepData);});
            typeName = "BOOL";
            condition = "objectVehicle";
            defaultValue = "(false)";
        };
        // VBIED VARIATION (SETTINGS)
        class GVAR(variationSub) {
            data = "AttributeSystemSubcategory";
            control = QGVAR(Sub);
            displayName = ECSTRING(ied,IED_Category);
        };
        class GVAR(variation) {
            property = QGVAR(variation);
            control = QGVAR(Combo);
            displayName = ECSTRING(ied,Variation);
            tooltip = CSTRING(Variation_Tooltip);
			expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultVariation);
            typeName = "NUMBER";
            condition = "objectVehicle";
            class Values {
                class 1	{
                    name = ECSTRING(ied,Variation_1);
                    value = 0;
                };
                class 2	{
                    name = ECSTRING(ied,Variation_2);
                    value = 1;
                };
                class 3	{
                    name = ECSTRING(ied,Variation_3);
                    value = 2;
                };
                class 4	{
                    name = ECSTRING(ied,Variation_4);
                    value = 3;
                };
                class 5	{
                    name = ECSTRING(ied,Variation_5);
                    value = 4;
                };
                class 6 {
                    name = ECSTRING(ied,Name_Random);
                    value = 5;
                };
            };
        };
        class GVAR(size) {
            displayName = ECSTRING(ied,Size);
            tooltip = ECSTRING(ied,Size_Tooltip);
            property = QGVAR(size);
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QGVAR(defaultSize);
            control = "Combo";
            typeName = "NUMBER";
            condition = "objectVehicle";
            class Values {
                class 1	{
                    name = ECSTRING(ied,Name_Tiny);
                    value = 0;
                };
                class 2	{
                    name = ECSTRING(ied,Name_Small);
                    value = 1;
                };
                class 3	{
                    name = ECSTRING(ied,Name_Medium);
                    value = 2;
                };
                class 4	{
                    name = ECSTRING(ied,Name_Large);
                    value = 3;
                };
                class 5 {
                    name = ECSTRING(ied,Name_Huge);
                    value = 4;
                };
                class 6 {
                    name = ECSTRING(ied,Name_Random);
                    value = 5;
                };
            };
        };
        class GVAR(dud) {
            displayName = ECSTRING(ied,Dud);
            tooltip = CSTRING(Dud_Tooltip);
            property = QGVAR(dud);
            expression = "_this setVariable ['%s',_value];";
            control = "Slider";
            defaultValue = QGVAR(defaultDud);
            condition = "objectVehicle";
        };
        // VBIED POSITION
        class GVAR(positionSub) {
            data = "AttributeSystemSubcategory";
            control = QGVAR(Sub);
            displayName = CSTRING(PositionSub);
        };
        class GVAR(position) {
            control = QGVAR(PosCombo);
            displayName = CSTRING(Position_DisplayName);
            tooltip = CSTRING(Position_Tooltip);
            property = QGVAR(position);
			expression = "_this setVariable ['%s',_value];";
            defaultValue = "[0,1] select ((_this call iedd_vbied_fnc_modelDefault) select 0 > -1)";
            typeName = "NUMBER";
            condition = "objectVehicle";
            unique = 0;
        };
        class GVAR(edit) {
            displayName = CSTRING(Defined_Name);
            tooltip = CSTRING(Defined_Name_ToolTip);
            property = QGVAR(edit);
            control = QGVAR(Edit);
            condition = "objectVehicle";
            defaultValue = "User Defined Position";
            typeName = "STRING";
        };
        class GVAR(pos) {
            displayName = CSTRING(Defined_Pos);
            tooltip = CSTRING(Defined_Pos_Tooltip);
            property = QGVAR(pos);
            control = QGVAR(UserDefined);
            expression = "_this setVariable ['%s', _value];";
            defaultValue = "[0.0,0.0,0.0]";
            unique = 0;
            condition = "objectVehicle";
            validate = "none";
            typeName = "ARRAY";
        };
        class GVAR(dir) {
            displayName = CSTRING(Defined_Dir);
            tooltip = CSTRING(Defined_Dir_Tooltip);
            property = QGVAR(dir);
            control = QGVAR(UserDefined);
            expression = "_this setVariable ['%s', _value];";
            defaultValue = "[0.0,0.0,0.0]";
            unique = 0;
            condition = "objectVehicle";
            validate = "none";
            typeName = "ARRAY";
        };
        class GVAR(up) {
            displayName = CSTRING(Defined_Up);
            tooltip = CSTRING(Defined_Up_Tooltip);
            property = QGVAR(up);
            control = QGVAR(UserDefined);
            expression = "_this setVariable ['%s', _value];";
            defaultValue = "[0.0,0.0,0.0]";
            unique = 0;
            condition = "objectVehicle";
            validate = "none";
            typeName = "ARRAY";
        };
        class GVAR(saveDelete) {
            displayName = CSTRING(SaveDelete);
            tooltip = CSTRING(SaveDelete_Tooltip);
            property = QGVAR(saveDelete);
            control = QGVAR(saveDelete);
            condition = "objectVehicle";
        };
        // EVENTHANDLERS
        class GVAR(EHS) {
            data = "AttributeSystemSubcategory";
            control = QGVAR(Sub);
            displayName = CSTRING(EHSSub);
        };
        class GVAR(getIn) {
			displayName = CSTRING(GetIn);
			tooltip = CSTRING(GetIn_Tooltip);
			property = QGVAR(getIn);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultGetIn);
			typeName = "NUMBER";
            condition = "objectVehicle";
			class Values {
				class 1	{
					name = ECSTRING(ied,Name_Disabled);
					value = 0;
				};
				class 2	{
					name = ECSTRING(ied,Name_Enabled);
					value = 1;
				};
				class 3	{
					name = ECSTRING(ied,Name_Random);
					value = 2;
				};
			};
		};
        class GVAR(engineOn) {
			displayName = CSTRING(EngineOn);
			tooltip = CSTRING(EngineOn_Tooltip);
			property = QGVAR(engineOn);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultEngineOn);
			typeName = "NUMBER";
            condition = "objectVehicle";
			class Values {
				class 1	{
					name = ECSTRING(ied,Name_Disabled);
					value = 0;
				};
				class 2	{
					name = ECSTRING(ied,Name_Enabled);
					value = 1;
				};
				class 3	{
					name = ECSTRING(ied,Name_Random);
					value = 2;
				};
			};
		};

        class GVAR(moving) {
			displayName = CSTRING(Moving);
			tooltip = CSTRING(Moving_Tooltip);
			property = QGVAR(moving);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultMoving);
			typeName = "NUMBER";
            condition = "objectVehicle";
			class Values {
				class 1	{
					name = ECSTRING(ied,Name_Disabled);
					value = 0;
				};
				class 2	{
					name = ECSTRING(ied,Name_Enabled);
					value = 1;
				};
				class 3	{
					name = ECSTRING(ied,Name_Random);
					value = 2;
				};
			};
		};
        class GVAR(speed) {
            displayName = CSTRING(Speed);
            tooltip = CSTRING(Speed_ToolTip);
            property = QGVAR(speed);
            expression = "_this setVariable ['%s',_value];";
            control = QGVAR(speedSlider);
            defaultValue = QGVAR(defaultSpeed);
            typeName = "NUMBER";
            condition = "objectVehicle";
        };

        class GVAR(distance) {
            displayName = ECSTRING(ied,Distance);
            tooltip = CSTRING(Distance_Tooltip);
            property = QGVAR(distance);
            expression = "_this setVariable ['%s',_value];";
            control = QGVAR(distanceSlider);
            typeName = "NUMBER";
            defaultValue = "0";
            condition = "objectVehicle";
        };
        /**********TIMER SETTINGS ********/
		class GVAR(timerSub) {
			data = "AttributeSystemSubcategory";
			control = "SubCategory";
			displayName = ECSTRING(Ied,Timer_Category);
		};
		class GVAR(timer) {
			displayName = ECSTRING(Ied,Timer);
			tooltip = CSTRING(Timer_Tooltip);
			property = QGVAR(timer);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultTimer);
			typeName = "NUMBER";
            condition = "objectVehicle";
			class Values {
				class 1	{
					name = ECSTRING(Ied,Name_Disabled);
					value = 0;
				};
				class 2	{
					name = ECSTRING(Ied,Name_Enabled);
					value = 1;
				};
				class 3	{
					name = ECSTRING(Ied,Name_Random);
					value = 2;
				};
			};
		};
		class GVAR(timerValue) {
			displayName = ECSTRING(Ied,TimerValue);
			tooltip = ECSTRING(Ied,TimerValue_Tooltip);
			property = QGVAR(timerValue);
			control = QGVAR(timeSlider);
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultTimerValue);
			typeName = "NUMBER";
            condition = "objectVehicle";
		};
		class GVAR(randomTimer) {
			displayName = ECSTRING(Ied,RandomTimer);
			tooltip =ECSTRING(Ied,RandomTimer_Tooltip);
			property = QGVAR(randomTimer);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultRandomTimer);
			typeName = "NUMBER";
            condition = "objectVehicle";
			class Values {
				class 1	{
					name = ECSTRING(Ied,Name_Disabled);
					value = 0;
				};
				class 2	{
					name = ECSTRING(Ied,Name_Enabled);
					value = 1;
				};
				class 3	{
					name = ECSTRING(Ied,Name_Random);
					value = 2;
				};
			};
		};
		class GVAR(randomTimerMin) {
			displayName = ECSTRING(Ied,RandomTimerMin);
			tooltip = ECSTRING(Ied,RandomTimerMin_Tooltip);
			property = QGVAR(randomTimerMin);
			control = QGVAR(timeSlider);
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultTimerMin);
			typeName = "NUMBER";
            condition = "objectVehicle";
		};
		class GVAR(randomTimerMax) {
			displayName = ECSTRING(Ied,RandomTimerMax);
			tooltip = ECSTRING(Ied,RandomTimerMax_Tooltip);
			property = QGVAR(randomTimerMax);
			control = QGVAR(timeSlider);
			expression = "_this setVariable ['%s',_value];";
			defaultValue = QGVAR(defaultTimerMax);
			typeName = "NUMBER";
            condition = "objectVehicle";
		};
    };
};
