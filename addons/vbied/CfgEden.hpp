#define ATTRIBUTE_Y_VALUE   0.80
#define ATTRIBUTE_H_VALUE   15
#define GRID_Y_POS (GRID_H * ATTRIBUTE_Y_VALUE)
#define GRID_H_POS (GRID_H * ATTRIBUTE_H_VALUE)
#define GRID_W_POS (GRID_H * ATTRIBUTE_H_VALUE)
#define CTRL_H(H) H * 4.5 * GRID_H
#define CTRL_DEFAULT_H (SIZE_M * GRID_H)
#define EDIT_W 3.3
class ctrlCheckbox;
class ctrlControlsGroup;
class ctrlStatic;
class ctrlEdit;
class ctrlCombo;
class ctrlButton;
class Cfg3DEN {
    class Attributes {
        #include "controls.hpp"
    };
    class object {
        class AttributeCategories {
            class iedd_vbied_attributes {
                class Attributes {
                    class GVAR(vbiedSub) {
                        property = QGVAR(vbiedSub);
                        control = QGVAR(SubVbied);
                        displayName = "IS VBIED";
                        defaultValue = "_this call iedd_vbied_fnc_modelDefault";
                        condition = "objectVehicle";
                    };
                    class GVAR(isVbied) {
                        property = QGVAR(isVbied);
                        control = "CheckboxState";
                        displayName = "IS VBIED";
                        tooltip = "IS VBIED IS";
                        expression = QUOTE(if (_value) then {[ARR_2(_this,true)] call FUNC(setVbied);_this setVariable [ARR_3(QQGVAR(isVbied),_value,true)]});
                        typeName = "BOOL";
                        condition = "objectVehicle";
                        defaultValue = "(false)";
                    };
                    /** VBIED VARIATION (SETTINGS) **/
                    class GVAR(variationSub) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = QGVAR(Sub);
                        displayName = ECSTRING(ied,IED_Category); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(variation) {
                        property = QGVAR(variation);
                        control = QGVAR(Combo);
                        displayName = ECSTRING(Ied,Variation);
                        tooltip = ECSTRING(Ied,Variation_Tooltip);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(variation),_value,true)]);
                        defaultValue = 5;
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        class Values {
                            class 1	{
                                name = ECSTRING(Ied,Variation_1);
                                value = 0;
                            };
                            class 2	{
                                name = ECSTRING(Ied,Variation_2);
                                value = 1;
                            };
                            class 3	{
                                name = ECSTRING(Ied,Variation_3);
                                value = 2;
                            };
                            class 4	{
                                name = ECSTRING(Ied,Variation_4);
                                value = 3;
                            };
                            class 5	{
                                name = ECSTRING(Ied,Variation_5);
                                value = 4;
                            };
                            class 6 {
                                name = ECSTRING(Ied,Name_Random);
                                value = 5;
                            };
                        };
                    };
                    class GVAR(size) {
                        displayName = ECSTRING(Ied,Size);
                        tooltip = ECSTRING(Ied,Size_Tooltip);
                        property = QGVAR(size);
                        expression = "_this setVariable ['%s',_value];";
                        defaultValue = "2";
                        control = "Combo";
                        typeName = "NUMBER";
                        class Values {
                            class 1	{
                                name = ECSTRING(Ied,Name_Tiny);
                                value = 0;
                            };
                            class 2	{
                                name = ECSTRING(Ied,Name_Small);
                                value = 1;
                            };
                            class 3	{
                                name = ECSTRING(Ied,Name_Medium);
                                value = 2;
                            };
                            class 4	{
                                name = ECSTRING(Ied,Name_Large);
                                value = 3;
                            };
                            class 5 {
                                name = ECSTRING(Ied,Name_Huge);
                                value = 4;
                            };
                            class 6 {
                                name = ECSTRING(Ied,Name_Random);
                                value = 5;
                            };
                        };
                    };
                    class GVAR(dud) {
                        displayName = ECSTRING(Ied,Dud);
                        tooltip = ECSTRING(Ied,Dud_Tooltip);
                        property = QGVAR(dud);
                        expression = "_this setVariable ['%s',_value];";
                        control = "Slider";
                        defaultValue = "0.15";
                    };
                    class GVAR(distance) {
                        displayName = ECSTRING(Ied,Distance);
                        tooltip = ECSTRING(Ied,Distance_Tooltip);
                        property = QGVAR(distance);
                        expression = "_this setVariable ['%s',_value];";
                        control = QEGVAR(ied,distanceSlider);
                        typeName = "NUMBER";
                        defaultValue = "0";
                    };
                    /** VBIED POSITION **/
                    class GVAR(positionSub) {
                        data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
                        control = QGVAR(Sub);
                        displayName = CSTRING(PositionSub); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
                    };
                    class GVAR(position) {
                        control = QGVAR(PosCombo);
                        displayName = CSTRING(Position_DisplayName);
                        tooltip = CSTRING(Position_Tooltip);
                        property = QGVAR(position);
                        expression = QUOTE(_this setVariable [ARR_3(QQGVAR(variation),_value,true)]);
                        defaultValue = 0;
                        typeName = "NUMBER";
                        condition = "objectVehicle";
                        unique = 0;
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
                        displayName = "SAVE USER DEFINED POS";
                        property = QGVAR(saveDelete);
                        control = QGVAR(saveDelete);
                        condition = "objectVehicle";
                    };
                };
            };
        };
    };
};