class GVAR(RcsVbied): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsVbied))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RcsVbied))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setVbied));
                    idc = 52500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(12.1));
                    class controls {
                        class GVAR(posL): RscText {
                            idc = -1;
                            text = CSTRING(Zeus_Pos);
                            tooltip = CSTRING(Zeus_Pos_Tooltip);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class GVAR(pos): RscCombo {
                            idc = 52520;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};
                            onLBSelChanged = QUOTE(_this call FUNC(vbiedSelected));
                            onLoad = QUOTE(ARR_2([{call FUNC(vbiedSelected)},ARR_2([_this select 0,0])]) call CBA_fnc_execNextFrame);
                            class Items {
                                /*TO-DO GET ALL VBIEDS POSITIONS*/
                                class 0 {
                                    value = -1;
                                    text = "THERE IS NO VBIED POSITIONS";
                                    default = 1;
                                };
                            };
                        };

                        class GVAR(variationL): GVAR(posL) {
                            text = CSTRING(Zeus_Variation);
                            tooltip = CSTRING(Zeus_Vbied_Var_Tooltip);
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
                                    text = ECSTRING(ied,Name_Random);
                                    value = 5;
                                    default = 1;
                                };
                            };
                        };

                        class GVAR(sizeL): GVAR(posL) {
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

                        class GVAR(dudL): GVAR(posL) {
                            text = CSTRING(Zeus_Dud_Category);
                            tooltip = ECSTRING(vbied,Dud_Tooltip);
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(dudSlider): RscXSliderH {
                            idc = 52523;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(3.3));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                         class GVAR(distanceL): GVAR(posL) {
                            text = CSTRING(Zeus_Distance_Category);
                            tooltip = ECSTRING(ied,Distance_Tooltip);
                            y = QUOTE(H_PART(4.4));
                        };

                        class GVAR(distanceSlider): RscXSliderH {
                            sliderRange[] = {0, 30};
                            idc = 52524;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(4.4));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };

                        /*EHS*/
                        class GVAR(getInL): GVAR(posL) {
                            text = CSTRING(Zeus_GetIn);
                            tooltip = ECSTRING(vbied,GetIn_Tooltip);
                            y = QUOTE(H_PART(5.5));
                        };
                        class GVAR(getIn): RscCombo {
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
                        class GVAR(engineOnL): GVAR(posL) {
                            text = CSTRING(Zeus_EngineOn);
                            tooltip = ECSTRING(vbied,EngineOn_Tooltip);
                            y = QUOTE(H_PART(6.6));
                        };
                        class GVAR(engineOn): RscCombo {
                            idc = 52526;
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
                                class 3	{
                                    text = ECSTRING(ied,Name_Random);
                                    value = 2;
                                };
                            };
                        };
                        class GVAR(movingOnL): GVAR(posL) {
                            text = CSTRING(Zeus_Moving);
                            tooltip = ECSTRING(vbied,Moving_Tooltip);
                            y = QUOTE(H_PART(7.7));
                        };
                        class GVAR(moving): RscCombo {
                            idc = 52527;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(7.7));
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
                        class GVAR(speedL): GVAR(posL) {
                            text = CSTRING(Zeus_Speed);
                            tooltip = ECSTRING(vbied,Speed_Tooltip);
                            y = QUOTE(H_PART(8.8));
                        };
                        class GVAR(speedSlider): RscXSliderH {
                            sliderRange[] = {0, 50};
                            text = ECSTRING(vbied,Speed);
                            idc = 52528;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(8.8));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };

                        class GVAR(timerL): GVAR(posL) {
                            text = CSTRING(Zeus_Timer);
                            tooltip = ECSTRING(vbied,Timer_Tooltip);
                            y = QUOTE(H_PART(9.9));
                        };
                        class GVAR(timer): RscCombo {
                            idc = 52529;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(9.9));
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

                        class GVAR(TimerValueL): GVAR(posL) {
                            text = CSTRING(Zeus_TimerValue_Category);
                            tooltip = CSTRING(Zeus_TimerValue_Tooltip);
                            y = QUOTE(H_PART(11));
                        };
                        class GVAR(TimerValueSlider): RscXSliderH {
                            sliderRange[] = {0, 300};
                            text = ECSTRING(ied,Timer);
                            idc = 52530;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(11));
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
