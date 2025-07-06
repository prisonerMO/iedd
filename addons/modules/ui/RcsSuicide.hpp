class GVAR(RscSuicide): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RscSuicide))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RscSuicide))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setSuicide));
                    idc = 62500;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(9.1));
                    class controls {
                        class GVAR(variationL): RscText {
                            idc = -1;
                            text = CSTRING(Zeus_Variation);
                            tooltip = CSTRING(Zeus_Ied_Var_Tooltip);
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
                                    default = 1;
                                };
                                class 4 {
                                    text = ECSTRING(ied,Name_Large);
                                    value = 3;
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
                        class GVAR(actL): GVAR(variationL) {
                            text = CSTRING(Zeus_Act_Category);
                            tooltip = ECSTRING(ied,DistanceActivate_Tooltip);
                            y = QUOTE(H_PART(3.3));
                        };
                        class GVAR(actSlider): RscXSliderH {
                            text = ECSTRING(ied,DistanceActivate);
                            idc = 62524;
                            sliderRange[] = {0, 1000};
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(3.3));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                        class GVAR(expL): GVAR(variationL) {
                            text = CSTRING(Zeus_Exp_Category);
                            tooltip = ECSTRING(ied,DistanceExplosion_Tooltip);
                            y = QUOTE(H_PART(4.4));
                        };
                        class GVAR(expSlider): RscXSliderH {
                            text = ECSTRING(ied,DistanceExplosion);
                            idc = 62525;
                            sliderRange[] = {0, 50};
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(4.4));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                        };
                        class GVAR(dmsL): GVAR(variationL) {
                            text = CSTRING(Zeus_Dms_Category);
                            tooltip = ECSTRING(ied,isDeadManSwitch_Description);
                            y = QUOTE(H_PART(5.5));
                        };
                        class GVAR(dms): RscCombo {
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
                        class GVAR(sideL): GVAR(variationL) {
                            text = CSTRING(Zeus_Sides_Category);
                            tooltip = ECSTRING(ied,Sides_Description);
                            y = QUOTE(H_PART(6.6));
                        };
                        class GVAR(blufor):RscCheckBox {
                            idc = 62527;
                            x = QUOTE(W_PART(11.5));
                            y = QUOTE(H_PART(6.6));
                            w = QUOTE(W_PART(2.5));
                            h = QUOTE(H_PART(2.5));
                            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
                            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
                            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
                            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
                            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
                            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
                            tooltip="$STR_WEST";

                        };
                        class GVAR(opfor):GVAR(blufor) {
                            idc = 62528;
                            x = QUOTE(W_PART(14.5));
                            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
                            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
                            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
                            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
                            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
                            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
                            tooltip="$STR_EAST";
                        };
                        class GVAR(guer):GVAR(blufor) {
                            idc = 62529;
                            x = QUOTE(W_PART(17.1));
                            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
                            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
                            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
                            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
                            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
                            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
                            tooltip="$STR_Guerrila";
                        };
                        class GVAR(civ):GVAR(blufor) {
                            idc = 62530;
                            x = QUOTE(W_PART(19.7));
                            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
                            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
                            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
                            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
                            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
                            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
                            tooltip="$STR_Civilian";
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
