class GVAR(display) {
    idd = NOTEBOOK_IDC_DISPLAY;
    movingEnable = 1;
    onLoad = "uiNamespace setVariable ['iedd_display', _this #0]; [(_this #0)] call iedd_notebook_fnc_esc;";

    // Background
    class ControlsBackground {
        class GVAR(bgImg): RscPicture {
            idc = NOTEBOOK_IDC_BG;
            text = QPATHTOF(images\brside\back0.paa);
            onLoad = "";
            x = QUOTE(GUI_GRID_CENTER_X + -9.5 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -4.75 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 60);
            h = QUOTE(GUI_GRID_CENTER_H * 30);
        };
    };

    // Controls
    class Controls {

        class GVAR(back): RscPicture {
            idc = NOTEBOOK_IDC_BACK;
            style = 48;
            type = CT_STATIC;
            x = QUOTE(GUI_GRID_CENTER_X + -9.5 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -4.75 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 60);
            h = QUOTE(GUI_GRID_CENTER_H * 30);
        };

        // ARROWS

        class GVAR(prev): RscActiveText {
            idc = NOTEBOOK_IDC_PREV;
            style = 48;
            text = QPATHTOF(images\brside\prev.paa);
            tooltip = CSTRING(Previous);
            onButtonClick = QUOTE([-1] call FUNC(browse));
            color[] = {0.9,0.9,0.9,0.9};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 0 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 24 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 4);
            h = QUOTE(GUI_GRID_CENTER_H * 1);
        };

        class GVAR(next): RscActiveText {
            idc = NOTEBOOK_IDC_NEXT;
            style = 48;
            text = QPATHTOF(images\brside\next.paa);
            tooltip = CSTRING(Next);
            onButtonClick = QUOTE([1] call FUNC(browse));
            color[] = {0.9,0.9,0.9,0.9};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 37 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 24 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 4);
            h = QUOTE(GUI_GRID_CENTER_H * 1);
        };

        // TABS

        class GVAR(home): RscActiveText {
            idc = NOTEBOOK_IDC_HOME;
            style = 48;
            text = QPATHTOF(images\brside\h.paa);
            tooltip = CSTRING(Introduction);
            onButtonClick = QUOTE(['home'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.3 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -3.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(info): RscActiveText {
            idc = NOTEBOOK_IDC_INFO;
            style = 48;
            text = QPATHTOF(images\brside\i.paa);
            tooltip = CSTRING(Contents);
            onButtonClick = QUOTE(['info'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.3 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -2 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(about): RscActiveText {
            idc = NOTEBOOK_IDC_ABOUT;
            style = 48;
            text = QPATHTOF(images\brside\a.paa);
            tooltip = CSTRING(About);
            onButtonClick = QUOTE(['about'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.305 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -0.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(can): RscActiveText {
            idc = NOTEBOOK_IDC_CAN;
            style = 48;
            text = QPATHTOF(images\brside\1.paa);
            tooltip = CSTRING(PlasticCanister);
            onButtonClick = QUOTE(['can'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.3 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 1 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(jerry): RscActiveText {
            idc = NOTEBOOK_IDC_JERRY;
            style = 48;
            text = QPATHTOF(images\brside\2.paa);
            tooltip = CSTRING(FuelCanister);
            onButtonClick = QUOTE(['jerry'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.31 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 2.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(cardboard): RscActiveText {
            idc = NOTEBOOK_IDC_CD;
            style = 48;
            text = QPATHTOF(images\brside\3.paa);
            tooltip = CSTRING(Cardboard);
            onButtonClick = QUOTE(['cardboard'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.315 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 4 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(cinder): RscActiveText {
            idc = NOTEBOOK_IDC_CINDER;
            style = 48;
            text = QPATHTOF(images\brside\4.paa);
            tooltip = CSTRING(Cinder);
            onButtonClick = QUOTE(['cinder'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.32 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 5.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(barrel): RscActiveText {
            idc = NOTEBOOK_IDC_BARREL;
            style = 48;
            text = QPATHTOF(images\brside\5.paa);
            tooltip = CSTRING(PlasticBarrel);
            onButtonClick = QUOTE(['barrel'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.325 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 7 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(metal): RscActiveText {
            idc = NOTEBOOK_IDC_METAL;
            style = 48;
            text = QPATHTOF(images\brside\6.paa);
            tooltip = CSTRING(MetalBarrel);
            onButtonClick = QUOTE(['metal'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.33 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 8.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(charge): RscActiveText {
            idc = NOTEBOOK_IDC_CHARGE ;
            style = 48;
            text = QPATHTOF(images\brside\7.paa);
            tooltip = CSTRING(Charge);
            onButtonClick = QUOTE(['charge'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.335 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 10 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(vbied): RscActiveText {
            idc = NOTEBOOK_IDC_VBIED;
            style = 48;
            text = QPATHTOF(images\brside\8.paa);
            tooltip = CSTRING(Vbied);
            onButtonClick = QUOTE(['vbied'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.4 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(bucket): RscActiveText {
            idc = NOTEBOOK_IDC_BUCKET;
            style = 48;
            text = QPATHTOF(images\brside\9.paa);
            tooltip = CSTRING(Bucket);
            onButtonClick = QUOTE(['bucket'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.345 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 13 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(empty4): RscActiveText {

            idc = NOTEBOOK_IDC_EMPTY4;
            style = 48;
            text = QPATHTOF(images\brside\10.paa);
            tooltip = CSTRING(Empty);
            onButtonClick = QUOTE(['empty4'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.35 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 14.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };


        class GVAR(dict): RscActiveText {

            idc = NOTEBOOK_IDC_DICT;
            style = 48;
            text = QPATHTOF(images\brside\d.paa);
            tooltip = CSTRING(Dictionary);
            onButtonClick = QUOTE(['dict'] call FUNC(tabs));
            color[] = {0.99,0.99,0.99,0.99};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.355 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 16 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };

        class GVAR(cred): RscActiveText {

            idc = NOTEBOOK_IDC_CRED;
            style = 48;
            text = QPATHTOF(images\brside\c.paa);
            tooltip = CSTRING(Credits);
            onButtonClick = QUOTE(['cred'] call FUNC(tabs));
            color[] = {1,1,1,1};
            colorActive[] = {0.2,0.2,0.2,0.2};
            colorDisabled[] = {1,1,1,1};
            x = QUOTE(GUI_GRID_CENTER_X + 41.36 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + 17.5 * GUI_GRID_CENTER_H);
            w = QUOTE(GUI_GRID_CENTER_W * 1.5);
            h = QUOTE(GUI_GRID_CENTER_H * 1.5);
        };
    };
};
