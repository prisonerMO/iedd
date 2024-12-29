class GVAR(RcsDecals): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsDecals))] call FUNC(attributes));
    onUnload = QUOTE([ARR_3('onUnload',_this,QQGVAR(RcsDecals))] call FUNC(attributes));
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class GVAR(scroll): RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(setGroundSign));
                    idc = 52600;
                    x = 0;
                    y = 0;
                    w = QUOTE(W_PART(26));
                    h = QUOTE(H_PART(0.9));
                    class controls {
                        class GVAR(typeL): RscText {
                            idc = -1;
                            text = CSTRING(Zeus_Sign_Category);
                            tooltip = CSTRING(Zeus_Sign_Category_Tooltip);
                            x = 0;
                            y = 0;
                            w = QUOTE(W_PART(10));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.5};
                        };
                        class GVAR(type): RscCombo {
                            idc = 52620;
                            x = QUOTE(W_PART(10.1));
                            y = 0;
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));
                            colorBackground[] = {0, 0, 0, 0.7};
                            class Items {
                                class 1 {
                                    data = "Land_Garbage_square3_F";
                                    text = CSTRING(Garbage_Small);
                                    default = 1;
                                };
                                class 2 {
                                    data = "Land_Garbage_square5_F";
                                    text = CSTRING(Garbage_Large);
                                };
                                class 3 {
                                    data = "Land_Garbage_line_F";
                                     text = CSTRING(Garbage_Line);
                                };
                                class 4 {
                                    data = "Land_Decal_RoadEdge_Dirt_03_F";
                                    text = CSTRING(RoadDirt_1);
                                };
                                class 5 {
                                    data = "Land_Decal_RoadEdge_Dirt_09_F";
                                    text = CSTRING(RoadDirt_2);
                                };
                                class 6 {
                                    data = "Land_Decal_RoadEdge_Dirt_07_F";
                                    text = CSTRING(RoadDirt_3);
                                };
                                class 7 {
                                    data = "Land_Decal_RoadEdge_Dirt_06_F";
                                    text = CSTRING(RoadDirt_4);
                                };
                                class 8 {
                                    data = "Land_Decal_RoadEdge_Dirt_01_F";
                                    text = CSTRING(RoadDirt_5);
                                };
                                class 9 {
                                    data = "Land_Decal_RoadEdge_Dirt_02_F";
                                    text = CSTRING(RoadDirt_6);
                                };
                                class 10 {
                                    data = "Land_Decal_RoadEdge_Dirt_10_F";
                                    text = CSTRING(RoadDirt_7);
                                };
                                class 11 {
                                    data = "Land_Decal_RoadCrack_Grass_04_F";
                                    text = CSTRING(Crack_1);
                                };
                                class 12 {
                                    data = "Land_Decal_RoadCrack_Grass_05_F";
                                    text = CSTRING(Crack_2);
                                };
                                class 13 {
                                    data = "Land_Decal_RoadCrack_Grass_01_F";
                                    text = CSTRING(Crack_3);
                                };
                                class 14 {
                                    data = "Land_dirt_road_rocks_04_F";
                                    text = CSTRING(DirtRocks_1);
                                };
                                class 15 {
                                    data = "Land_dirt_road_rocks_01_F";
                                    text = CSTRING(DirtRocks_2);
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