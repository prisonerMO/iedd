class CBA_Extended_EventHandlers;
class CfgVehicles {
	class Item_Base_F;
    class Box_NATO_Equip_F;
	class GVAR(Box):Box_NATO_Equip_F {
		author = "prisoner";
		displayName = CSTRING(EquipmentBox_displayName);
		editorCategory = "IEDD_MAINCATEGORY"; 
		editorSubcategory = "IEDD_EQUIPMENT";	
		vehicleClass = "IEDD_EQUIPMENT";
		scope = 2; //Scope 2 will show in editor
		scopeCurator = 2;
		class TransportWeapons {
			IEDD_ADDWEAPON(ACE_VMH3,1);
			IEDD_ADDWEAPON(ACE_VMM3,1);
		};	
		
		class TransportMagazines {
			IEDD_ADDMAGAZINE(Chemlight_Blue,10);
			IEDD_ADDMAGAZINE(Chemlight_Green,10);
			IEDD_ADDMAGAZINE(Chemlight_Red,10);
			IEDD_ADDMAGAZINE(Chemlight_Yellow,10);
			IEDD_ADDMAGAZINE(SmokeShell,10);
			IEDD_ADDMAGAZINE(SmokeShellBlue,10);
			IEDD_ADDMAGAZINE(SmokeShellGreen,10);
			IEDD_ADDMAGAZINE(SmokeShellRed,10);
			IEDD_ADDMAGAZINE(SmokeShellYellow,10);
			IEDD_ADDMAGAZINE(DemoCharge_Remote_Mag,20);
			IEDD_ADDMAGAZINE(SatchelCharge_Remote_Mag,10);
		};
		class TransportItems {		
			IEDD_ADDITEM(iedd_item_notebook,1);	
			IEDD_ADDITEM(ACE_wirecutter,2);				
			IEDD_ADDITEM(ACE_Clacker,2);
			IEDD_ADDITEM(ACE_M26_Clacker,2);
			IEDD_ADDITEM(ACE_DefusalKit,2);
			IEDD_ADDITEM(ace_marker_flags_blue,10);
			IEDD_ADDITEM(ace_marker_flags_green,10);
			IEDD_ADDITEM(ace_marker_flags_red,10);
			IEDD_ADDITEM(ace_marker_flags_yellow,10);
			IEDD_ADDITEM(ACE_SpraypaintBlue,2);
			IEDD_ADDITEM(ACE_SpraypaintBlack,2);
			IEDD_ADDITEM(ACE_SpraypaintRed,2);
			IEDD_ADDITEM(ACE_SpraypaintGreen,2);			
			IEDD_ADDITEM(ACE_Sandbag_empty,20);
			IEDD_ADDITEM(ACE_EntrenchingTool,2);			
			IEDD_ADDITEM(ACE_Flashlight_XL50,2);
			IEDD_ADDITEM(Binocular,1);
			IEDD_ADDITEM(MineDetector,1);
		};
		class TransportBackpacks {};	
	};
	class iedd_Item_Base: Item_Base_F {
		author = AUTHOR;
		scope = 0;
		scopeCurator = 0;
		scopeArsenal = 0;
		editorCategory = "IEDD_MAINCATEGORY"; 
		editorSubcategory = "IEDD_ITEMS";
		vehicleClass = "IEDD_ITEMS";
	};
	class iedd_Item_Notebook: iedd_Item_Base {
		type = 1;
		scope = 2; //Scope 2 will show in editor
		scopeCurator = 2;
		displayName = ECSTRING(main,Category_Main);
		descriptionShort = CSTRING(descriptionShort);
		picture = QPATHTOEF(models,preview\notebook.paa); //Displays icon in your Inventory
		model = QPATHTOEF(models,data\IEDD_notebook.p3d);
		icon = QPATHTOEF(models,preview\notebook.paa); //Leave as is "iconObject_circle"
		editorPreview = QPATHTOEF(models,preview\notebook.paa);
		ace_dragging_canDrag = 0;
		ace_dragging_canCarry = 0;
		class TransportItems {
			IEDD_ADDITEM(iedd_item_notebook,1);
		};	
		class ACE_Actions {
			class ACE_MainActions {
				displayName = CSTRING(PickUp);
				icon = "\a3\ui_f\data\igui\cfg\actions\take_ca.paa";
				distance = 2;
				position = "";
				condition = QUOTE(true);
				statement = QUOTE([ARR_2(_player,_target)] call EFUNC(notebook,pick));  
			}; 
		};
		class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
	};
};