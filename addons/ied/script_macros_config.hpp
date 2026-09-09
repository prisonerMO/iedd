#define EMPTY_CLASS ;
#define IED_COLOR_CLASS ;\
    class GVAR(color) {\
        displayName = CSTRING(Color);\
        tooltip = CSTRING(Color_Tooltip);\
        property = QGVAR(color);\
        expression = "_this setVariable ['%s',_value];";\
        defaultValue = QGVAR(defaultColor);\
        control = "Combo";\
        typeName = "STRING";\
        class Values {\
            class 1	{name = CSTRING(Name_Green); value = "green";};\
            class 2	{name = CSTRING(Name_Blue); value = "Blue";};\
            class 3	{name = CSTRING(Name_Red); value = "red";};\
            class 4	{name = CSTRING(Name_White); value = "White";};\
            class 5 {name = CSTRING(Name_Random); value = "random";};\
        };\
    };

#define IED_SETTINGS_CATEGORY\
class GVAR(ied_SubCategory) {\
    data = "AttributeSystemSubcategory";\
    control = "SubCategory";\
    displayName = CSTRING(IED_Category);\
}
#define IED_DEFAULT_CATEGORY(color_value)\
        class GVAR(ied_SubCategory) {\
            data = "AttributeSystemSubcategory";\
            control = "SubCategory";\
            displayName = CSTRING(IED_Category);\
        }\
        color_value\
        class GVAR(variation) {\
            displayName = CSTRING(Variation);\
            tooltip = CSTRING(Variation_Tooltip);\
            property = QGVAR(variation);\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultVariation);\
            control = "Combo";\
            typeName = "NUMBER";\
            class Values {\
                class 1	{\
                    name = CSTRING(Variation_1);\
                    value = 0;\
                };\
                class 2	{\
                    name = CSTRING(Variation_2);\
                    value = 1;\
                };\
                class 3	{\
                    name = CSTRING(Variation_3);\
                    value = 2;\
                };\
                class 4	{\
                    name = CSTRING(Variation_4);\
                    value = 3;\
                };\
                class 5	{\
                    name = CSTRING(Variation_5);\
                    value = 4;\
                };\
                class 6 {\
                    name = CSTRING(Variation_X);\
                    value = 5;\
                };\
                class 7 {\
                    name = CSTRING(Name_Random);\
                    value = 6;\
                };\
            };\
        };\
        class GVAR(varX) {\
            displayName = CSTRING(VarX);\
            tooltip = CSTRING(VarX_Tooltip);\
            property = QGVAR(varX);\
            expression = "_this setVariable ['%s',_value];";\
            control = "Slider";\
            defaultValue = QGVAR(defaultVarX);\
        };\
        class GVAR(size) {\
            displayName = CSTRING(Size);\
            tooltip = CSTRING(Size_Tooltip);\
            property = QGVAR(size);\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultSize);\
            control = "Combo";\
            typeName = "NUMBER";\
            class Values {\
                class 1	{\
                    name = CSTRING(Name_Tiny);\
                    value = 0;\
                };\
                class 2	{\
                    name = CSTRING(Name_Small);\
                    value = 1;\
                };\
                class 3	{\
                    name = CSTRING(Name_Medium);\
                    value = 2;\
                };\
                class 4	{\
                    name = CSTRING(Name_Large);\
                    value = 3;\
                };\
                class 5 {\
                    name = CSTRING(Name_Huge);\
                    value = 4;\
                };\
                class 6 {\
                    name = CSTRING(Name_Random);\
                    value = 5;\
                };\
            };\
        };\
        class GVAR(decals) {\
            displayName = CSTRING(Decals);\
            tooltip = CSTRING(Decals_Tooltip);\
            property = QGVAR(decals);\
            control = "Combo";\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultDecals);\
            typeName = "BOOL";\
        };\
        class GVAR(dir) {\
            displayName = CSTRING(Dir);\
            tooltip = CSTRING(Dir_Tooltip);\
            property = QGVAR(dir);\
            control = "Combo";\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultDirection);\
            typeName = "BOOL";\
        };\
        class GVAR(dud) {\
            displayName = CSTRING(Dud);\
            tooltip = CSTRING(Dud_Tooltip);\
            property = QGVAR(dud);\
            expression = "_this setVariable ['%s',_value];";\
            control = "Slider";\
            defaultValue = QGVAR(defaultDud);\
        };\
        class GVAR(fake) {\
            displayName = CSTRING(Fake);\
            tooltip = CSTRING(Fake_Tooltip);\
            property = QGVAR(fake);\
            expression = "_this setVariable ['%s',_value];";\
            control = "Slider";\
            defaultValue = QGVAR(defaultFake);\
        };\
        class GVAR(distance) {\
            displayName = CSTRING(Distance);\
            tooltip = CSTRING(Distance_Tooltip);\
            property = QGVAR(distance);\
            expression = "_this setVariable ['%s',_value];";\
            control = QGVAR(distanceSlider);\
            typeName = "NUMBER";\
            defaultValue = "0";\
        }
        /**********TIMER SETTINGS ********/
#define IED_TIMER_CATEGORY\
        class GVAR(timer_SubCategory) {\
            data = "AttributeSystemSubcategory";\
            control = "SubCategory";\
            displayName = CSTRING(Timer_Category);\
        };\
        class GVAR(timer) {\
            displayName = CSTRING(Timer);\
            tooltip = CSTRING(Timer_Tooltip);\
            property = QGVAR(timer);\
            control = "Combo";\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultTimer);\
            typeName = "NUMBER";\
            class Values {\
                class 1	{\
                    name = CSTRING(Name_Disabled);\
                    value = 0;\
                };\
                class 2	{\
                    name = CSTRING(Name_Enabled);\
                    value = 1;\
                };\
                class 3	{\
                    name = CSTRING(Name_Random);\
                    value = 2;\
                };\
            };\
        };\
        class GVAR(timerValue) {\
            displayName = CSTRING(TimerValue);\
            tooltip = CSTRING(TimerValue_Tooltip);\
            property = QGVAR(timerValue);\
            control = QGVAR(timeSlider);\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultTimerValue);\
            typeName = "NUMBER";\
        };\
        class GVAR(randomTimer) {\
            displayName = CSTRING(RandomTimer);\
            tooltip = CSTRING(RandomTimer_Tooltip);\
            property = QGVAR(randomTimer);\
            control = "Combo";\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultRandomTimer);\
            typeName = "NUMBER";\
            class Values {\
                class 1	{\
                    name = CSTRING(Name_Disabled);\
                    value = 0;\
                };\
                class 2	{\
                    name = CSTRING(Name_Enabled);\
                    value = 1;\
                };\
                class 3	{\
                    name = CSTRING(Name_Random);\
                    value = 2;\
                };\
            };\
        };\
        class GVAR(randomTimerMin) {\
            displayName = CSTRING(RandomTimerMin);\
            tooltip = CSTRING(RandomTimerMin_Tooltip);\
            property = QGVAR(randomTimerMin);\
            control = QGVAR(timeSlider);\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultTimerMin);\
            typeName = "NUMBER";\
        };\
        class GVAR(randomTimerMax) {\
            displayName = CSTRING(RandomTimerMax);\
            tooltip = CSTRING(RandomTimerMax_Tooltip);\
            property = QGVAR(randomTimerMax);\
            control = QGVAR(timeSlider);\
            expression = "_this setVariable ['%s',_value];";\
            defaultValue = QGVAR(defaultTimerMax);\
            typeName = "NUMBER";\
        }
        /**********BURY SETTINGS ********/
#define IED_BURY_CATEGORY\
        class GVAR(bury_SubCategory) {\
            data = "AttributeSystemSubcategory";\
            control = "SubCategory";\
            displayName = CSTRING(Bury_Category);\
        };\
        class GVAR(isBury) {\
            property = QGVAR(isBury);\
            control = QGVAR(isBury);\
            displayName = CSTRING(isBury);\
            tooltip = CSTRING(isBury_Tooltip);\
            expression = QUOTE(if (is3DEN) then {\
                [ARR_2(_this,_value)] call FUNC(bury3DEN);\
            } else {\
                _this setVariable [ARR_2('%s',_value)];\
            });\
            typeName = "BOOL";\
            defaultValue = "(false)";\
        };\
		class GVAR(bury) {\
			displayName = CSTRING(Depth_DisplayName);\
			tooltip = CSTRING(Depth_Tooltip);\
			property = QGVAR(bury);\
			control = QGVAR(burySlider);\
			expression = QUOTE(if (is3DEN) then {\
                [ARR_2(_this,_value)] call FUNC(buryIED3DEN);\
            } else {\
                _this setVariable [ARR_2('%s',[ARR_2(parseNumber(_value toFixed 2),ARR_2(vectorDir _this,vectorUp _this))])];\
            });\
			defaultValue = -1;\
		}
        /**********PHONE SETTINGS ********/
#define IED_PHONE_CATEGORY\
        class GVAR(phone_SubCategory) {\
            data = "AttributeSystemSubcategory";\
            control = "SubCategory";\
            displayName = CSTRING(Phone_Category);\
        };\
        class GVAR(isPhone) {\
            displayName = CSTRING(isPhone);\
            tooltip = CSTRING(isPhone_Tooltip);\
            property = QGVAR(isPhone);\
            control = QGVAR(isPhone);\
            expression = QUOTE(\
            if (is3DEN) then {\
               [ARR_2(_this,_value)] spawn { waitUntil { !isNil 'iedd_ied_fnc_isPhone3DEN' }; call FUNC(isPhone3DEN); };\
            } else {\
                _this setVariable [ARR_2('%s',_value)];\
            });\
            typeName = "BOOL";\
            defaultValue = "(false)";\
        };\
        class GVAR(phoneNumber) {\
            property = QGVAR(phoneNumber);\
            control = QGVAR(phoneEdit);\
            displayName = CSTRING(phoneNumber);\
            tooltip = CSTRING(phoneNumber_Tooltip);\
            expression = QUOTE(_this setVariable [ARR_2('%s',_value)]);\
			typeName = "NUMBER";\
            defaultValue = "1234";\
            validate = "number";\
        };\
        class GVAR(phoneUnit) {\
            property = QGVAR(phoneUnit);\
            control = QGVAR(phoneEdit);\
            displayName = CSTRING(phoneUnit);\
            tooltip = CSTRING(phoneUnit_Tooltip);\
            expression = QUOTE(_this setVariable [ARR_2('%s',_value)]);\
            typeName = "STRING";\
            defaultValue = "''";\
        }

#define IED_TRAINING_ACTIONS\
    class ACE_Actions : ACE_Actions {\
        class ACE_MainActions : ACE_MainActions {\
            displayName = "$STR_ace_interaction_MainAction";\
            selection = "";\
            distance = 2;\
            condition = QUOTE(true);\
            class IEDD_ResetMenu {\
                exceptions[] = {"isNotSwimming"};\
                displayName = CSTRING(Reset_DisplayName);\
                condition = QUOTE(true);\
                insertChildren = QUOTE(_this call FUNC(getTrainingActions));\
            };\
        };\
    }

/**********BURY DEBUG SETTINGS
class GVAR(defaultBury) {\
    property = QGVAR(defaultBury);\
    control = "Edit";\
    displayName = "Default Bury Depth";\
    defaultValue = "format [""[X] %1 [Y] %2 [Z] %3"",getArray (configOf _this >> 'iedd_ied_buryDepth') select 0,getArray (configOf _this >> 'iedd_ied_buryDepth') select 1,getArray (configOf _this >> 'iedd_ied_buryDepth') select 2];";\
};\
class GVAR(depth) {\
    property = QGVAR(depth);\
    control = QGVAR(depth);\
    displayName = "DEPTH GAME";\
    expression = "_this setVariable ['%s', _value];";\
    defaultValue = "getArray (configOf _this >> 'iedd_ied_buryDepth');";\
    typeName = "ARRAY";\
};\
class GVAR(depth3DEN) {\
    property = QGVAR(depth3DEN);\
    control = QGVAR(depth);\
    displayName = "DEPTH EDEN";\
    expression = "_this setVariable ['%s', _value];";
    defaultValue = "getArray (configOf _this >> 'iedd_ied_buryDepth3DEN');";\
    typeName = "ARRAY";\
};
********/
