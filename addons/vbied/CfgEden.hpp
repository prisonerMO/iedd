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
//class ctrlStaticPictureKeepAspect;
class Cfg3DEN {
    class Attributes {
        #include "controls.hpp"
    };
    class object {
        class AttributeCategories {
            class iedd_vbied_attributes {
                class Attributes {
                    class GVAR(subAllowed)
                    {
                        property = QGVAR(subAllowed);
                        control = QGVAR(SubAllowed);
                        GVAR(nonAllowed) = CSTRING(NonAllowed_Desc);
                        GVAR(allowed) = CSTRING(Allowed_Desc);
                        defaultValue = "_this call iedd_vbied_fnc_allowedDefault";
                        condition = "objectVehicle";
                    };
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
                        class Values {
                            class 1	{
                                name = CSTRING(Position_1);
                                value = 0;
                            };
                            class 2	{
                                name = CSTRING(Position_2);
                                value = 1;
                            };
                            class 3	{
                                name = CSTRING(Position_3);
                                value = 2;
                            };
                            class 4	{
                                name = CSTRING(Position_4);
                                value = 3;
                            };
                            class 5	{
                                name = CSTRING(Position_5);
                                value = 4;
                            };
                            class 6 {
                                name = CSTRING(Position_6);
                                value = 5;
                            };
                            class 7 {
                                name = CSTRING(User_Defined);
                                value = 6;
                            };
                        };
                    };
                    class GVAR(userDefinedPos) {
                        control = QGVAR(UserDefined);
                        displayName = CSTRING(User_Defined_Pos);
                        tooltip = CSTRING(Position_User_Defined_Tooltip);
                        property = QGVAR(userDefinedPos);
                        expression = "systemChat str _this";
                        condition = "objectVehicle";
                        valitade = "number";
                    };
                    class GVAR(userDefinedDir) {
                        control = QGVAR(UserDefined);
                        displayName = CSTRING(User_Defined_Dir);
                        tooltip = CSTRING(User_Defined_Dir_Tooltip);
                        property = QGVAR(userDefinedDir);
                        expression = "systemChat str _this";
                        condition = "objectVehicle";
                        valitade = "number";
                    };
                    class GVAR(userDefinedUp) {
                        control = QGVAR(UserDefined);
                        displayName = CSTRING(User_Defined_Up);
                        tooltip = CSTRING(User_Defined_Dir_Up_Tooltip);
                        property = QGVAR(userDefinedUp);
                        expression = "systemChat str _this";
                        condition = "objectVehicle";
                        valitade = "number";
                    };
                };
            };
        };
    };
};