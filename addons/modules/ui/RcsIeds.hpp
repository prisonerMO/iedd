class GVAR(RcsIeds): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsIeds))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RcsIeds))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setIed));
                    idc = 52500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(7.7));
                    class controls {
                        class GVAR(typeL): RscText {
                            idc = -1;
                            text = CSTRING(Zeus_Type);
                            tooltip = CSTRING(Zeus_Type_Tooltip);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class GVAR(type): RscCombo {
                            idc = 52520;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};
                            onLBSelChanged = QUOTE(_this call FUNC(onSelVarChanged));
                            class Items {
                                class 1 {
                                    data = QEGVAR(ied,CanisterPlastic);
                                    text = ECSTRING(ied,PlasticCanister_DisplayName);
                                    default = 1;
                                };
                                class 2 {
                                    data = QEGVAR(ied,CanisterFuel);
                                    text = ECSTRING(ied,FuelCanister_Green);
                                };
                                class 3 {
                                    data = QEGVAR(ied,CanisterFuel);
                                    text = ECSTRING(ied,FuelCanister_Blue);
                                };
                                class 4 {
                                    data = QEGVAR(ied,CanisterFuel);
                                    text = ECSTRING(ied,FuelCanister_Red);
                                };
                                class 5 {
                                    data = QEGVAR(ied,CanisterFuel);
                                    text = ECSTRING(ied,FuelCanister_White);
                                };
                                class 6 {
                                    data = QEGVAR(ied,Cardboard);
                                    text = ECSTRING(ied,Cardboard_DisplayName);
                                };
                                class 7 {
                                    data = QEGVAR(ied,Cinder);
                                    text = ECSTRING(ied,Cinder_DisplayName);
                                };
                                class 8 {
                                    data = QEGVAR(ied,Barrel);
                                    text = ECSTRING(ied,Barrel_DisplayName);
                                };
                                class 9 {
                                    data = QEGVAR(ied,Barrel_Grey);
                                    text = ECSTRING(ied,BarrelGrey_DisplayName);
                                };
                                class 10 {
                                    data = QEGVAR(ied,Metal);
                                    text = ECSTRING(ied,MetalBarrel_DisplayName);
                                };
                                class 11 {
                                    data = QEGVAR(ied,Metal_English);
                                    text = ECSTRING(ied,MetalBarrelEnglish_DisplayName);
                                };
                                class 12 {
                                    data = QEGVAR(ied,Bucket);
                                    text = ECSTRING(ied,Bucket_DisplayName);
                                };
                            };
                        };

                        class GVAR(variationL): GVAR(typeL) {
                            text = CSTRING(Zeus_Variation);
                            tooltip = CSTRING(Zeus_Ied_Var_Tooltip);
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
                            text = CSTRING(Zeus_Size);
                            tooltip = CSTRING(Zeus_Size_Tooltip);
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
                            text = CSTRING(Zeus_Dud_Category);
                            tooltip = ECSTRING(ied,Dud_Tooltip);
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
                            text = CSTRING(Zeus_Distance_Category);
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
                            text = CSTRING(Zeus_Timer);
                            tooltip = CSTRING(Timer_Tooltip);
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
                            text = CSTRING(Zeus_TimerValue_Category);
                            tooltip = CSTRING(Zeus_TimerValue_Tooltip);
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
                        }; /*                       
                        class GVAR(openCloseL): GVAR(typeL) {
                            text = "openClose";
                            tooltip = "openClose";
                            y = QUOTE(H_PART(7.7));
                        };
                        class GVAR(openCloseSlider): RscXSliderH {
                            text ="openClose";
                            idc = 52527;
                            colorDisable[] = {1,1,1,0.4};
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(7.7));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                        class GVAR(openCloseEODL): GVAR(typeL) {
                            text = "openCloseEOD";
                            tooltip = "openCloseEOD";
                            y = QUOTE(H_PART(8.8));
                        };
                        class GVAR(openCloseEODSlider): RscXSliderH {
                            text = "openCloseEOD";
                            idc = 52528;
                            colorDisable[] = {1,1,1,0.4};
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(8.8));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };*/
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
