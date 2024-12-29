/*
class GVAR(RcsVbied): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsIeds))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RcsIeds))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setVbied));
                    idc = 95440; //IEDD
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(7.7));
                    class controls {
                        class GVAR(typeL): RscText {
                            idc = -1;
                            text = "TEST";
                            tooltip = "TEST";
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
*/