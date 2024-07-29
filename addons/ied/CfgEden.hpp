#define DEFAULT_ISCHARGEVEST ((_this get3DENAttribute 'iedd_ied_isCharge') select 0)

class Cfg3DEN {
    class Attributes {
        #include "controls.hpp"
    };
    class object {
        class AttributeCategories {
            class iedd_attributes {
                class Attributes {
                    class GVAR(ied_SubCategory) {
                        data = "AttributeSystemSubcategory";
                        control = "SubCategory";
                        displayName = CSTRING(IED_Category);
                    };
                    class GVAR(isCharge) {
                        property = QGVAR(isCharge);
                        control = QGVAR(isCharge);
                        displayName = CSTRING(isCharge_DisplayName);
                        tooltip = CSTRING(isCharge_Description);
                        expression = QUOTE(if (_value) then {[ARR_2(_this,true)] call FUNC(charge);_this setVariable [ARR_3(QQGVAR(isCharge),_value,true)]});
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = "(false)";
                    };
                    class GVAR(isSuicide) {
                        property = QGVAR(isSuicide);
                        control = QGVAR(isSuicide);
                        displayName = CSTRING(isSuicide_DisplayName);
                        tooltip = CSTRING(isSuicide_Description);
                        expression = QUOTE(if (_value) then {_this setVariable [ARR_3(QQGVAR(isSuicide),_value,true)]});
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = "(false)";
                    };
                    class GVAR(Charge_Settings) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = "SubCategory";
                        displayName = CSTRING(Charge_Settings_DisplayName); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(c_variation) {
                        displayName = CSTRING(Variation);
                        tooltip = CSTRING(Variation_Tooltip);
                        property = QGVAR(c_variation);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_variation),_value,true)]);
                        defaultValue = 5;
                        control = "Combo";
                        typeName = "NUMBER";
                        condition = "objectControllable";
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
                                name = CSTRING(Name_Random);
                                value = 5;
                            };
                        };
                    };
                    class GVAR(c_size) {
                        displayName = CSTRING(Size);
                        tooltip = CSTRING(Size_Tooltip);
                        property = QGVAR(c_size);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_size),_value,true)]);
                        defaultValue = 2;
                        control = "Combo";
                        typeName = "NUMBER";
                        condition = "objectControllable";
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
                    class GVAR(c_dud) {
                        displayName = CSTRING(Dud);
                        tooltip = CSTRING(ChargeDud_Tooltip);
                        property = QGVAR(c_dud);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_dud),_value,true)]);
                        control = "Slider";
                        condition = "objectControllable";
                        defaultValue = 0;
                    };
                    /* SUICIDE SETTINGS */
                    class GVAR(Suicide_Status) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = "SubCategory";
                        displayName = CSTRING(Suicide_Settings_DisplayName); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(expDist) {
                        displayName = CSTRING(DistanceExplosion);
                        tooltip = CSTRING(DistanceExplosion_Tooltip);
                        property = QGVAR(expDist);
                        expression = "_this setVariable ['%s',_value];";
                        control = QGVAR(distanceExplosion);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = "0";
                        enable = 0;
                    };
                    class GVAR(actDist) {
                        displayName = CSTRING(DistanceActivate);
                        tooltip = CSTRING(DistanceActivate_Tooltip);
                        property = QGVAR(actDist);
                        expression = "_this setVariable ['%s',_value];";
                        control = QGVAR(distanceActivate);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        defaultValue = "0";
                        enable = 0;
                    };
                    class GVAR(isDeadManSwitch) {
                        property = QGVAR(isDeadManSwitch);
                        control = QGVAR(distDMS);
                        displayName = CSTRING(isDeadManSwitch_DisplayName);
                        tooltip = CSTRING(isDeadManSwitch_Description);
                        expression = "_this setVariable ['%s',_value];";
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = "(false)";
                    };

                    /*UNIT STATUS*/
                    class GVAR(Charge_Status) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = "SubCategory";
                        displayName = CSTRING(Charge_Status_DisplayName); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(isHandcuffed) {
                        property = QGVAR(isHandcuffed);
                        control = QGVAR(isHandcuffed);
                        displayName = CSTRING(isHandcuffed_DisplayName);
                        tooltip = CSTRING(isHandcuffed_Description);
                        expression = QUOTE([ARR_4(_this,_value,'ace_isHandcuffed',QQGVAR(isHandcuffed))] call FUNC(setAttributes));
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = QUOTE(true);
                    };
                    class GVAR(isSurrendered) {
                        property = QGVAR(isSurrendered);
                        control = QGVAR(isSurrendered);
                        displayName = CSTRING(isSurrendered_DisplayName);
                        tooltip = CSTRING(isSurrendered_Description);
                        expression = QUOTE([ARR_4(_this,_value,'ace_isSurrendered',QQGVAR(isSurrendered))] call FUNC(setAttributes));
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = QUOTE(false);
                    };
                    /**********TIMER SETTINGS ********/
                    class GVAR(c_timer_SubCategory) {
                        data = "AttributeSystemSubcategory";
                        control = "SubCategory";
                        displayName = CSTRING(Timer_Category);
                    };
                    class GVAR(c_timer) {
                        displayName = CSTRING(Timer);
                        tooltip = CSTRING(Timer_Tooltip);
                        property = QGVAR(c_timer);
                        control = QGVAR(c_timer);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_timer),_value,true)]);
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
                        condition = "objectControllable";
                    };
                    class GVAR(c_timerValue) {
                        displayName = CSTRING(TimerValue);
                        tooltip = CSTRING(TimerValue_Tooltip);
                        property = QGVAR(c_timerValue);
                        control = QGVAR(timeSlider); // TODO time_slider min - max
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_timerValue),_value,true)]);
                        defaultValue = QGVAR(defaultTimerValue);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                    };
                    class GVAR(c_randomTimer) {
                        displayName = CSTRING(RandomTimer);
                        tooltip = CSTRING(RandomTimer_Tooltip);
                        property = QGVAR(c_randomTimer);
                        control = QGVAR(c_timer);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_randomTimer),_value,true)]);
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
                        condition = "objectControllable";
                    };
                    class GVAR(c_randomTimerMin) {
                        displayName = CSTRING(RandomTimerMin);
                        tooltip = CSTRING(RandomTimerMin_Tooltip);
                        property = QGVAR(c_randomTimerMin);
                        control = QGVAR(timeSlider); // TODO time_slider min - max
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_randomTimerMin),_value,true)]);
                        defaultValue = QGVAR(defaultTimerMin);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                    };
                    class GVAR(c_randomTimerMax) {
                        displayName = CSTRING(RandomTimerMax);
                        tooltip = CSTRING(RandomTimerMax_Tooltip);
                        property = QGVAR(c_randomTimerMax);
                        control = QGVAR(timeSlider); // TODO time_slider min - max
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(c_randomTimerMax),_value,true)]);
                        defaultValue = QGVAR(defaultTimerMax);
                        typeName = "NUMBER";
                        condition = "objectControllable";
                    };
                };
            };
        };
    };
};