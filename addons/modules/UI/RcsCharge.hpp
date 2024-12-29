class GVAR(RscCharge): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RscCharge))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RscCharge))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setCharge));
                    idc = 62500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(7.7));
                    class controls {
                        class GVAR(variationL): RscText {
                            idc = -1;
                            text = CSTRING(Zeus_Variation);
                            tooltip = CSTRING(Zeus_Variation_Tooltip);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                        };
                        class GVAR(variation): RscCombo {
                            idc = 62521;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
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
                                    value = 5;
                                    text = ECSTRING(ied,Name_Random);
                                    default = 1;
                                };
                            };
                        };
                        class GVAR(sizeL): GVAR(variationL) {
                            text = CSTRING(Zeus_Size);
                            tooltip = CSTRING(Zeus_Size_Tooltip);
                            y = QUOTE(H_PART(1.1));
                        };
                        class GVAR(size): RscCombo {
                            idc = 62522;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(1.1));
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
                                    text = ECSTRING(ied,Name_Random);
                                    value = 4;
                                };
                            };
                        };

                        class GVAR(dudL): GVAR(variationL) {
                            text = CSTRING(Zeus_Dud_Category);
                            tooltip = ECSTRING(ied,Dud_Tooltip);
                            y = QUOTE(H_PART(2.2));
                        };
                        class GVAR(dudSlider): RscXSliderH {
                            text = ECSTRING(ied,Dud);
                            idc = 62523;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(2.2));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                        class GVAR(timerL): GVAR(variationL) {
                            text = CSTRING(Zeus_Timer);
                            tooltip = CSTRING(Timer_Tooltip);
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(timer): RscCombo {
                            idc = 62524;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(3.3));
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
                        class GVAR(timerValueL): GVAR(variationL) {
                            text = CSTRING(Zeus_TimerValue_Category);
                            tooltip = CSTRING(Zeus_TimerValue_Tooltip);
                            y = QUOTE(H_PART(4.4));
                        };
                        class GVAR(timerValueSlider): RscXSliderH {
                            sliderRange[] = {0, 300};
                            text = ECSTRING(ied,Timer);
                            idc = 62525;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(4.4));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };

                        class GVAR(handcuffedL): GVAR(variationL) {
                            text = CSTRING(Zeus_Handcuffed_Category);
                            tooltip = ECSTRING(ied,isHandcuffed_Description);
                            y = QUOTE(H_PART(5.5));
                        };
                        class GVAR(handcuffed):RscCombo {
                            idc = 62526;
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
                            };
                        };

                        class GVAR(surrenderedL): GVAR(variationL) {
                            text = CSTRING(Zeus_Surrendered_Category);
                            tooltip = ECSTRING(ied,isSurrendered_Description);
                            y = QUOTE(H_PART(6.6));
                        };
                        class GVAR(surrendered):RscCombo {
                            idc = 62527;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(6.6));
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
                            };
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};