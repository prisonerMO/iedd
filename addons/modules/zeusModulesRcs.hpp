#include "\a3\3DEN\UI\macros.inc"
#include "\a3\ui_f\hpp\definedikcodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineresincl.inc"

#define SIZEX ((safeZoneW / safeZoneH) min 1.2)
#define SIZEY (SIZEX / 1.2)
#define W_PART(num) (num * (SIZEX / 40))
#define H_PART(num) (num * (SIZEY / 25))
#define X_PART(num) (W_PART(num) + (safeZoneX + (safeZoneW - SIZEX) / 2))
#define Y_PART(num) (H_PART(num) + (safeZoneY + (safeZoneH - SIZEY) / 2))
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscListbox;
class RscCombo;
class RscEdit;
class RscXSliderH;
class RscCheckBox;
class RscActivePicture;
class RscMapControl;
class RscPicture;
class ctrlToolbox;
class RscButton;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content: RscControlsGroup {
            class controls;
        };
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(RcsIeds): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsIeds))] call FUNC(attributes); GVAR(variations) = 5);
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
                    h = QUOTE(H_PART(5.5));
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
                            };
                        };
                        class GVAR(variationL): GVAR(typeL) {
                            text = CSTRING(Zeus_Variation);
                            tooltip = CSTRING(Zeus_Variation_Tooltip);
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
                                    text = ECSTRING(ied,Name_Small);
                                    value = 0;
                                };
                                class 2 {
                                    text = ECSTRING(ied,Name_Medium);
                                    value = 1;
                                };
                                class 3 {
                                    text = ECSTRING(ied,Name_Large);
                                    value = 2;
                                    default = 1;                                                                      
                                };
                                class 4 {
                                    text = ECSTRING(ied,Name_Huge);
                                    value = 3;
                                };
                                class 5 {
                                    text = ECSTRING(ied,Name_Random);                                
                                    value = 4;                                
                                };
                            };
                        };

                        class GVAR(dudSlider): RscXSliderH {
                            text = ECSTRING(ied,Dud); 
                            tooltip = ECSTRING(ied,Dud_Tooltip); 
                            idc = 52523;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(3.3));
                            w = QUOTE(W_PART(15.9));
                            h = QUOTE(H_PART(1));                            
                        };
                        class GVAR(dudL): GVAR(typeL) {                       
                            text = CSTRING(Zeus_Dud_Category);
                            y = QUOTE(H_PART(3.3));
                        };

                        class GVAR(timerL): GVAR(typeL) {
                            text = CSTRING(Zeus_Timer);
                            tooltip = CSTRING(Timer_Tooltip);
                            y = QUOTE(H_PART(4.4));
                        };
                        class GVAR(timer): RscCombo {
                            idc = 52524;
                            x = QUOTE(W_PART(10.1));
                            y = QUOTE(H_PART(4.4));
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
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};

class GVAR(RcsDecals): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad',_this,QQGVAR(RcsDecals))] call FUNC(attributes); GVAR(variations) = 5);
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