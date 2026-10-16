class GVAR(RscSetIED): RscDisplayAttributes {
    onLoad = "[""onLoad"",_this,""iedd_zeus_RscSetIED"",'CuratorDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
    onUnload = "[""onUnload"",_this,""iedd_zeus_RscSetIED"",'CuratorDisplays'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
    filterAttributes = 1;
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setIed));
                    
                            
                    onLoad = QUOTE(_this call FUNC(setIEDOnLoad));
                    idc = 52500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(7.7));
                    class controls {                        
                        class GVAR(typeL): RscText {
                            idc = -1;
                            text = CSTRING(Type);
                            tooltip = CSTRING(Type_Tooltip);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class GVAR(type): RscText {
                            text="TESTTEST";
                            idc = 52520;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};
                        };

                        class GVAR(variationL): GVAR(typeL) {
                            text = CSTRING(Variation);
                            tooltip = CSTRING(Ied_Var_Tooltip);
                            y = QUOTE(H_PART(1.1));
                        };
                        class GVAR(variation): RscCombo {
                            idc = 52521;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(1.1));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};

                            class Items {
                                class 1 {
                                    value = 0;
                                    text = ECSTRING(ied,Variation_1);
                                };
                                class 2 {
                                    value = 1;
                                    text = ECSTRING(ied,Variation_2);
                                };
                                class 3 {
                                    value = 2;
                                    text = ECSTRING(ied,Variation_3);
                                };
                                class 4 {
                                    value = 3;
                                    text = ECSTRING(ied,Variation_4);
                                };
                                class 5 {
                                    value = 4;
                                    text = ECSTRING(ied,Variation_5);
                                };
                                class 6 {
                                    text = ECSTRING(ied,Variation_X);
                                    value = 5;
                                };
                                class 7 {
                                    text = ECSTRING(ied,Name_Random);
                                    value = 6;
                                    default = 1;
                                };
                            };
                        };

                        class GVAR(sizeL): GVAR(typeL) {
                            text = CSTRING(Size);
                            tooltip = CSTRING(Size_Tooltip);
                            y = QUOTE(H_PART(2.2));
                        };
                        class GVAR(size): RscCombo {
                            idc = 52522;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(2.2));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};

                            class Items {
                                class 1 {
                                    text = ECSTRING(ied,Name_Tiny);
                                    value = 0;
                                };
                                class 2 {
                                    text = ECSTRING(ied,Name_Small);
                                    value = 1;
                                };
                                class 3 {
                                    text = ECSTRING(ied,Name_Medium);
                                    value = 2;
                                };
                                class 4 {
                                    text = ECSTRING(ied,Name_Large);
                                    value = 3;
                                    default = 1;
                                };
                                class 5 {
                                    text = ECSTRING(ied,Name_Huge);
                                    value = 4;
                                };
                                class 6 {
                                    text = ECSTRING(ied,Name_Random);
                                    value = 5;
                                };
                            };
                        };

                        class GVAR(dudL): GVAR(typeL) {
                            text = CSTRING(Dud_Category);
                            tooltip = CSTRING(Dud_Tooltip);
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(dudSlider): RscXSliderH {
                            text = ECSTRING(ied,Dud);
                            idc = 52523;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(3.3));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                         class GVAR(distanceL): GVAR(typeL) {
                            text = CSTRING(Act_Category);
                            tooltip = ECSTRING(ied,Distance_Tooltip);
                            y = QUOTE(H_PART(4.4));
                        };

                        class GVAR(distanceSlider): RscXSliderH {
                            sliderRange[] = {0, 30};
                            text = ECSTRING(ied,Distance);
                            idc = 52524;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(4.4));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };

                        class GVAR(timerL): GVAR(typeL) {
                            text = CSTRING(Timer_Category);
                            tooltip = ECSTRING(ied,Timer_Tooltip);
                            y = QUOTE(H_PART(5.5));
                        };
                        class GVAR(timer): RscCombo {
                            idc = 52525;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(5.5));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};
                            class Items {
                                class 1	{
                                    text = ECSTRING(ied,Name_Disabled);
                                    value = 0;
                                    default = 1;
                                };
                                class 2	{
                                    text = ECSTRING(ied,Name_Enabled);
                                    value = 1;
                                };
                                class 3	{
                                    text = ECSTRING(ied,Name_Random);
                                    value = 2;
                                };
                            };
                        };

                        class GVAR(TimerValueL): GVAR(typeL) {
                            text = CSTRING(TimerValue_Category);
                            tooltip = CSTRING(TimerValue_Tooltip);
                            y = QUOTE(H_PART(6.6));
                        };
                        class GVAR(TimerValueSlider): RscXSliderH {
                            sliderRange[] = {0, 300};
                            text = ECSTRING(ied,Timer);
                            idc = 52526;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(6.6));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
