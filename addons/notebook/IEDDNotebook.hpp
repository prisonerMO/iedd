class GVAR(display) {
	idd = -1;
	movingEnable = 1;
	onLoad = "uiNamespace setVariable ['iedd_display', _this #0]; [(_this #0)] call iedd_notebook_fnc_esc;";

	// Background
	class ControlsBackground {
		class GVAR(bgImg): RscPicture {
			idc = 110;
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
			idc = 120;
			style = 48;
			type = CT_STATIC;
			x = QUOTE(GUI_GRID_CENTER_X + -9.5 * GUI_GRID_CENTER_W);
            y = QUOTE(GUI_GRID_CENTER_Y + -4.75 * GUI_GRID_CENTER_H); 
            w = QUOTE(GUI_GRID_CENTER_W * 60);
            h = QUOTE(GUI_GRID_CENTER_H * 30);	
		};

		// ARROWS

		class GVAR(prev): RscActiveText {

			idc = 121;
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

			idc = 122;
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

			idc = 201;
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

			idc = 202;
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

			idc = 203;
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

			idc = 204;
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

			idc = 205;
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

			idc = 206;
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

			idc = 207;
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

			idc = 208;
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

			idc = 209;
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

		class GVAR(empty1): RscActiveText {

			idc = 210;
			style = 48;
			text = QPATHTOF(images\brside\7.paa);
			tooltip = CSTRING(Empty);
			onButtonClick = QUOTE(['empty1'] call FUNC(tabs));
			color[] = {1,1,1,1};
			colorActive[] = {0.2,0.2,0.2,0.2};
			colorDisabled[] = {1,1,1,1};
			x = QUOTE(GUI_GRID_CENTER_X + 41.335 * GUI_GRID_CENTER_W);	
			y = QUOTE(GUI_GRID_CENTER_Y + 10 * GUI_GRID_CENTER_H); 		
			w = QUOTE(GUI_GRID_CENTER_W * 1.5);				
			h = QUOTE(GUI_GRID_CENTER_H * 1.5);			
		};

		class GVAR(empty2): RscActiveText {

			idc = 211;
			style = 48;
			text = QPATHTOF(images\brside\8.paa);
			tooltip = CSTRING(Empty);
			onButtonClick = QUOTE(['empty2'] call FUNC(tabs));
			color[] = {1,1,1,1};
			colorActive[] = {0.2,0.2,0.2,0.2};
			colorDisabled[] = {1,1,1,1};
			x = QUOTE(GUI_GRID_CENTER_X + 41.4 * GUI_GRID_CENTER_W);
			y = QUOTE(GUI_GRID_CENTER_Y + 11.5 * GUI_GRID_CENTER_H); 		
			w = QUOTE(GUI_GRID_CENTER_W * 1.5);				
			h = QUOTE(GUI_GRID_CENTER_H * 1.5);			
		};

		class GVAR(empty3): RscActiveText {

			idc = 212;
			style = 48;
			text = QPATHTOF(images\brside\9.paa);
			tooltip = CSTRING(Empty);
			onButtonClick = QUOTE(['empty3'] call FUNC(tabs));
			color[] = {1,1,1,1};
			colorActive[] = {0.2,0.2,0.2,0.2};
			colorDisabled[] = {1,1,1,1};
			x = QUOTE(GUI_GRID_CENTER_X + 41.345 * GUI_GRID_CENTER_W);	
			y = QUOTE(GUI_GRID_CENTER_Y + 13 * GUI_GRID_CENTER_H); 		
			w = QUOTE(GUI_GRID_CENTER_W * 1.5);				
			h = QUOTE(GUI_GRID_CENTER_H * 1.5);			
		};

		class GVAR(empty4): RscActiveText {

			idc = 213;
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

			idc = 214;
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

			idc = 215;
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
