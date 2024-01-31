#define DEFAULT_ISCHARGEVEST ((_this get3DENAttribute 'iedd_ied_isCharge') select 0)

class Cfg3DEN {
    class Object {
        class AttributeCategories {
            class iedd_attributes {
                class Attributes {
                    class GVAR(isCharge) {
                        property = QGVAR(isCharge);
                        control = "CheckboxState";
                        displayName = CSTRING(isCharge_DisplayName);
                        tooltip = CSTRING(isCharge_Description);
                        expression = QUOTE(if (_value) then {[ARR_2(_this,true)] call FUNC(charge);_this setVariable [ARR_3(QQGVAR(isCharge),_value,true)]});
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = "(false)";
                    };                    
                    class GVAR(Charge_Settings) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = "SubCategory";
                        displayName = CSTRING(Charge_Settings_DisplayName); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(charge_variation) {
                        displayName = CSTRING(Variation);
                        tooltip = CSTRING(Variation_Tooltip);
                        property = QGVAR(charge_variation);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(charge_variation),_value,true)]);
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
                    class GVAR(charge_timer) {
                        displayName = CSTRING(Timer);
                        tooltip = CSTRING(Timer_Tooltip);
                        property = QGVAR(charge_timer);
                        control = "Combo";
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(charge_timer),_value,true)]);
                        defaultValue = 0;		
                        typeName = "BOOL";
                    };	
                    class GVAR(charge_size) {
                        displayName = CSTRING(Size);
                        tooltip = CSTRING(Size_Tooltip);
                        property = QGVAR(charge_size);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(charge_size),_value,true)]);
                        defaultValue = 0;
                        control = "Combo";
                        typeName = "NUMBER";
                        condition = "objectControllable";
                        class Values {
                            class 1	{
                                name = CSTRING(Name_Small);	
                                value = 0;
                            }; 
                            class 2	{
                                name = CSTRING(Name_Medium); 
                                value = 1;
                            };
                            class 3	{
                                name = CSTRING(Name_Large); 
                                value = 2;
                            };
                            class 4 {
                                name = CSTRING(Name_Huge);
                                value = 3;
                            }; 							
                            class 5 {
                                name = CSTRING(Name_Random);
                                value = 4;
                            }; 
                            
                        };
                    };
                    class GVAR(charge_dud) {
                        displayName = CSTRING(Dud);
                        tooltip = CSTRING(ChargeDud_Tooltip);
                        property = QGVAR(charge_dud);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(charge_dud),_value,true)]);
                        control = "Slider";
                        condition = "objectControllable";
                        defaultValue = 0;
                    };
                    class GVAR(Charge_Status) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = "SubCategory";
                        displayName = CSTRING(Charge_Status_DisplayName); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(isHandcuffed) {
                        property = QGVAR(isHandcuffed);
                        control = "Checkbox";
                        displayName = CSTRING(isHandcuffed_DisplayName);
                        tooltip = CSTRING(isHandcuffed_Description);
                        expression = QUOTE([ARR_4(_this,_value,'ace_isHandcuffed',QQGVAR(isHandcuffed))] call FUNC(setAttributes));
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = QUOTE(true);
                    };
                    class GVAR(isSurrendered) {
                        property = QGVAR(isSurrendered);
                        control = "Checkbox";
                        displayName = CSTRING(isSurrendered_DisplayName);
                        tooltip = CSTRING(isSurrendered_Description);
                        expression = QUOTE([ARR_4(_this,_value,'ace_isSurrendered',QQGVAR(isSurrendered))] call FUNC(setAttributes));
                        typeName = "BOOL";
                        condition = "objectControllable";
                        defaultValue = QUOTE(false);
                    };
                };
            };
        };
    };
};