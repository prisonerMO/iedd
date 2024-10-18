class Display3DEN
{
	class Controls
	{
		class MenuStrip: ctrlMenuStrip
		{
			class Items
			{
				class Tools
				{
					items[]+=
					{
						QGVAR(folder)
					};
				};
                class GVAR(folder)
				{
					text=ECSTRING(main,Category_Main);
					picture="\a3\3DEN\Data\Displays\Display3DEN\ToolBar\open_ca.paa";
					items[]=
					{
						QGVAR(openNotebook)
					};
				};
				class GVAR(openNotebook)
				{
					text=CSTRING(Action_Open);
					picture="";
					action="(findDisplay 313) createDisplay 'iedd_notebook_display'";
					opensNewWindow=1;
                    shortCuts[] = {"1024+0xD0"};
				};
            };
        };
    };
};
