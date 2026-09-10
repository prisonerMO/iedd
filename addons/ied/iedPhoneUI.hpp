class RscText;
class RscEdit;
class GVAR(CallScreenEdit): RscEdit {
    canModify = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorSelection[] = {
        "(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    text = "";
    style = "0x00 + 0x40 + 0x200";
    shadow = 1;
    SizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20) * 0.8)";
};
class GVAR(RscText): RscText {
    canModify = 0;
    idc = -1;
    colorText[] = {0,0,0,0.9};
    SizeEx = "(((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 20) * 0.8)";
    shadow = 0;
    x = QUOTE(GUI_GRID_CENTER_X + 3.35 * GUI_GRID_CENTER_W);
    y = QUOTE(GUI_GRID_CENTER_Y + 6.7 * GUI_GRID_CENTER_H);
    w = QUOTE(GUI_GRID_CENTER_W * 4);
    h = QUOTE(GUI_GRID_CENTER_H * 1);
    text = "Name:";
};
class RscPicture;
class RscButton;
class GVAR(HideButton): RscButton {
    colorBackground[] = {0, 0, 0, 0};
    colorText[] = {0, 0, 0, 0};
    colorDisabled[] = {0, 0, 0, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    colorBackgroundActive[] = {0, 0, 0, 0};
    colorFocused[] = {0, 0, 0, 0};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 0};
    w = QUOTE(GUI_GRID_CENTER_W * 1.1);
    h = QUOTE(GUI_GRID_CENTER_H * 1.1);
    shadow = 0;
};

class GVAR(PhoneInterface) {
    idd = 96000;
    movingEnable = 1;
    onLoad = QUOTE(GVAR(currentSpeedDial) = -1;);
    class Controls {
        class RscPicture_1200: RscPicture {
            idc = 96100;
            text = QPATHTOF(data\iedPhone.paa);
            x = QUOTE(GUI_GRID_CENTER_X + GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 10);
            h = QUOTE(GUI_GRID_CENTER_H * 20);
        };
        class GVAR(NumKey_1): GVAR(HideButton) {
            idc = 96110;
            x = QUOTE(GUI_GRID_CENTER_X + 3 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 13.5 * GUI_GRID_CENTER_H);
            tooltip = "1";
            action = "ctrlSetText [96303, (ctrlText 96303) + '1'];";
        };
        class GVAR(NumKey_2): GVAR(NumKey_1) {
            idc = 96111;
            x = QUOTE(GUI_GRID_CENTER_X + 5.55 * GUI_GRID_CENTER_W);            
            y = QUOTE(GUI_GRID_CENTER_Y + 13.8 * GUI_GRID_CENTER_H);
            tooltip = "2";
            action = "ctrlSetText [96303, (ctrlText 96303) + '2'];";
        };
        class GVAR(NumKey_3): GVAR(NumKey_1) {
            idc = 96112;
            x = QUOTE(GUI_GRID_CENTER_X + 8.1 * GUI_GRID_CENTER_W);
            tooltip = "3";
            action = "ctrlSetText [96303, (ctrlText 96303) + '3'];";
        };
        class GVAR(NumKey_4): GVAR(NumKey_1) {
            idc = 96113;            
            y = QUOTE(GUI_GRID_CENTER_Y + 15.03 * GUI_GRID_CENTER_H);
            tooltip = "4";
            action = "ctrlSetText [96303, (ctrlText 96303) + '4'];";
        };
        class GVAR(NumKey_5): GVAR(NumKey_2) {
            idc = 96114;
            y = QUOTE(GUI_GRID_CENTER_Y + 15.35 * GUI_GRID_CENTER_H);
            tooltip = "5";
            action = "ctrlSetText [96303, (ctrlText 96303) + '5'];";
        };
        class GVAR(NumKey_6): GVAR(NumKey_3) {
            idc = 96115;
            y = QUOTE(GUI_GRID_CENTER_Y + 15.03 * GUI_GRID_CENTER_H);
            tooltip = "6";
            action = "ctrlSetText [96303, (ctrlText 96303) + '6'];";
        };
        class GVAR(NumKey_7): GVAR(NumKey_1) {
            idc = 96116;            
            y = QUOTE(GUI_GRID_CENTER_Y + 16.56 * GUI_GRID_CENTER_H);            
            x = QUOTE(GUI_GRID_CENTER_X + 3.1 * GUI_GRID_CENTER_W);
            tooltip = "7";
            action = "ctrlSetText [96303, (ctrlText 96303) + '7'];";
        };
        class GVAR(NumKey_8): GVAR(NumKey_2) {
            idc = 96117;
            y = QUOTE(GUI_GRID_CENTER_Y + 16.9 * GUI_GRID_CENTER_H);
            tooltip = "8";
            action = "ctrlSetText [96303, (ctrlText 96303) + '8'];";
        };
        class GVAR(NumKey_9): GVAR(NumKey_3) {
            idc = 96118;
            y = QUOTE(GUI_GRID_CENTER_Y + 16.56 * GUI_GRID_CENTER_H);
            x = QUOTE(GUI_GRID_CENTER_X + 8 * GUI_GRID_CENTER_W);
            tooltip = "9";
            action = "ctrlSetText [96303, (ctrlText 96303) + '9'];";
        };
        class GVAR(NumKey_Star): GVAR(NumKey_1) {
            idc = 96119;
            y = QUOTE(GUI_GRID_CENTER_Y + 18.09 * GUI_GRID_CENTER_H);
            x = QUOTE(GUI_GRID_CENTER_X + 3.2 * GUI_GRID_CENTER_W);
            tooltip = "ADD TO SPEED DIAL IED";
            action = QUOTE([ARR_2(ctrlText 96301,ctrlText 96303)] call FUNC(addToSpeedDial));
        };
        class GVAR(NumKey_0): GVAR(NumKey_2) {
            idc = 96120;
            y = QUOTE(GUI_GRID_CENTER_Y + 18.45 * GUI_GRID_CENTER_H);
            tooltip = "0";
            action = "ctrlSetText [96303, (ctrlText 96303) + '0'];";
        };
        class GVAR(NumKey_Hash): GVAR(NumKey_3) {
            idc = 96121;
            y = QUOTE(GUI_GRID_CENTER_Y + 18.09 * GUI_GRID_CENTER_H);
            x = QUOTE(GUI_GRID_CENTER_X + 7.9 * GUI_GRID_CENTER_W);
            tooltip = "#";
            action = "ctrlSetText [96303, (ctrlText 96303) + '#'];";
        };      
        class GVAR(NumKey_Clear): GVAR(HideButton) {
            idc = 96200;
            x = QUOTE(GUI_GRID_CENTER_X + 3.3 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H);
            tooltip = "Clear";
            action = "ctrlSetText [96303, ''];";
        };
        class GVAR(NumKey_Dial): GVAR(HideButton) {
            idc = 96201;
            x = QUOTE(GUI_GRID_CENTER_X + 5 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 10.6 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 2.2);
            tooltip ="DIAL";// CSTRING(Phone_Dial);
            action = QUOTE([ARR_2(ACE_player,ctrlText 96303)] call FUNC(dialPhone));
        };
        class GVAR(NumKey_Up): GVAR(HideButton) {
            idc = 96202;
            x = QUOTE(GUI_GRID_CENTER_X + 8.1 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H);
            tooltip = "UP";//CSTRING(Phone_Up);
            action = QUOTE(1 call FUNC(setSpeedDial));
        };
        class GVAR(NumKey_Down): GVAR(NumKey_Up) {
            idc = 96203;
            x = QUOTE(GUI_GRID_CENTER_X + 6.5 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 12.2 * GUI_GRID_CENTER_H);
            tooltip = "DOWN";//CSTRING(Phone_Down);
            action = QUOTE(-1 call FUNC(setSpeedDial));
        };

        /*TO-DO*/
        class GVAR(SpeedDialText): GVAR(RscText) {
            canModify = 0;
            idc = 96300;
            text = "Name:";
        };
        class GVAR(SpeedDialName): GVAR(CallScreenEdit) {
            idc = 96301;
            x = QUOTE(GUI_GRID_CENTER_X + 5.27 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 6.7 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 4);
            h = QUOTE(GUI_GRID_CENTER_H * 1);
        };
        class GVAR(NumberEditText): GVAR(RscText) {
            idc = 96302;
            y = QUOTE(GUI_GRID_CENTER_Y + 7.7 * GUI_GRID_CENTER_H);
            text = "#";
        };
        class GVAR(NumberEdit): GVAR(CallScreenEdit) {
            canModify = 0;
            idc = 96303;
            x = QUOTE(GUI_GRID_CENTER_X + 3.82 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 7.7 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 4);
            h = QUOTE(GUI_GRID_CENTER_H * 1);
        };
    };
};