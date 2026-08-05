class GVAR(RcsBuryIED): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsBuryIED))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RcsBuryIED))] call FUNC(attributes));
    movingEnable = 1;
    class Controls: Controls {
        class Background: Background {            
            colorBackground[] = {0, 0, 0, 0.1};
        };
        class Title: Title {};
        class Content: Content {            
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setBuryIED));
                    idc = 72500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(4.3));
                    //h = QUOTE(H_PART(7.7));
                    class controls {
                        class GVAR(pitchL): RscText {
                            idc = -1;
                            text = CSTRING(Pitch);
                            tooltip = CSTRING(Rotate_Ied);                            
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(7));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class GVAR(pitchSlider): RscXSliderH {
                            idc = 72520;
                            x = QUOTE(W_PART(7.1));
                            y = 0;
                            w = QUOTE(W_PART(16.1));
                            h = QUOTE(H_PART(1));
                            color[] = {1,1,1,0.4};
                            colorActive[] = {1,1,1,0.6};
                            colorDisable[] = {1,1,1,0.2};
                        };
                        class GVAR(pitchEdit): RscEdit {
                            idc = 72521;
                            x = QUOTE(W_PART(23.3));
                            y = 0;
                            w = QUOTE(W_PART(3));
                            h = QUOTE(H_PART(1));
                        };
                        // class GVAR(pitchText): RscText{
                        //     idc = 72521;
                        //     text = "0";
                        //     x = QUOTE(W_PART(23.3));
                        //     y = 0;
                        //     w = QUOTE(W_PART(3));
                        //     h = QUOTE(H_PART(1));
                        // };
                        class GVAR(rollL): GVAR(pitchL) {
                            text = CSTRING(Roll);
                            y = QUOTE(H_PART(1.1));
                        };
                        class GVAR(rollSlider): GVAR(pitchSlider) {
                            idc = 72522;
                            y = QUOTE(H_PART(1.1));
                        };
                        class GVAR(rollEdit): GVAR(pitchEdit) {
                            idc = 72523;
                            y = QUOTE(H_PART(1.1));
                        };
                        // class GVAR(rollText): GVAR(pitchText) {
                        //     idc = 72523;
                        //     y = QUOTE(H_PART(1.1));
                        // };
                        class GVAR(yawL): GVAR(pitchL) {
                            text = CSTRING(Yaw);
                            y = QUOTE(H_PART(2.2));
                        };
                        class GVAR(yawSlider): GVAR(pitchSlider) {
                            idc = 72524;
                            y = QUOTE(H_PART(2.2));
                        };
                        class GVAR(yawEdit): GVAR(pitchEdit) {
                            idc = 72525;
                            y = QUOTE(H_PART(2.2));
                        };
                        class GVAR(stepL): GVAR(pitchL) {
                            text = CSTRING(Depth);
                            tooltip = ECSTRING(ied,Depth_Tooltip);
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(stepSlider): GVAR(pitchSlider) {
                            idc = 72526;
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(stepEdit): GVAR(pitchEdit) {
                            idc = 72527;
                            y = QUOTE(H_PART(3.3));
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
