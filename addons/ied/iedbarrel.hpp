class Land_BarrelEmpty_F;
class GVAR(Barrel):Land_BarrelEmpty_F {
	displayName = CSTRING(Barrel_DisplayName); 
	author = AUTHOR;
	editorCategory = "IEDD_MAINCATEGORY"; 
	editorSubcategory = "IEDD_IEDS";
	class EventHandlers {
		class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};		
	};
	class ACE_Actions {
		class ACE_MainActions {
			displayName = "$STR_ace_interaction_MainAction";
			selection = "";
			distance = 2;
			condition = "true";
			class IEDD_DisarmMenu {
				exceptions[] = {"isNotSwimming"};
				displayName = CSTRING(Disarm_DisplayName); 
				condition = QUOTE(!isNil {_target getVariable QQGVAR(bomb)} && {[_player] call FUNC(canDisarm)});
				statement = "";
			};
		};
	};
	ace_dragging_canDrag = 1;
	ace_dragging_dragPosition[] = {0, 1, 0};
	ace_dragging_dragDirection = 0;
	ace_dragging_canCarry = 1;
	ace_dragging_carryPosition[] = {0, 0.6, 0};
	ace_dragging_carryDirection = 0;
	ace_cargo_size = 2;
	ace_cargo_canLoad = 1;
	ace_cargo_noRename = 1;
	ace_cargo_blockUnloadCarry = 0;
	iedd_ied_default = "Land_BarrelEmpty_F";
	class Attributes {
		class GVAR(variation) {
			displayName = CSTRING(Variation);
			tooltip = CSTRING(Variation_Tooltip);
			property = QGVAR(variation);
			expression = "_this setVariable ['%s',_value];";
			defaultValue = 5;
			control = "Combo";
			typeName = "NUMBER";
			class Values {
				class 1	{
					name = CSTRING(Variation_1);	
					value = 0;
				}; 
				class 2	{
					name = CSTRING(Variation_2); 
					value = 1;
				};
				class 3	{
					name = CSTRING(Variation_3); 
					value = 2;
				};
				class 4	{
					name = CSTRING(Variation_4);	
					value = 3;
				};
				class 5	{
					name = CSTRING(Variation_5);	
					value = 4;
				};
				class 6 {
					name = CSTRING(Name_Random);
					value = 5;
				}; 				
			};
		};	
		class GVAR(size) {
			displayName = CSTRING(Size);
			tooltip = CSTRING(Size_Tooltip);
			property = QGVAR(size);
			expression = "_this setVariable ['%s',_value];";
			defaultValue = 2;
			control = "Combo";
			typeName = "NUMBER";
			class Values {
				class 1	{
					name = CSTRING(Name_Small);	
					value = 0;
				}; 
				class 2	{
					name = CSTRING(Name_Medium); 
					value = 1;
				};
				class 3	{
					name = CSTRING(Name_Large); 
					value = 2;
				};
				class 4 {
					name = CSTRING(Name_Huge);
					value = 3;
				}; 							
				class 5 {
					name = CSTRING(Name_Random);
					value = 4;
				}; 
				
			};
		};
		class GVAR(decals) {
			displayName = CSTRING(Decals);
			tooltip = CSTRING(Decals_Tooltip);
			property = QGVAR(decals);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = 0;		
			typeName = "BOOL";
		};
		class GVAR(dir) {
			displayName = CSTRING(Dir);
			tooltip = CSTRING(Dir_Tooltip);
			property = QGVAR(dir);
			control = "Combo";
			expression = "_this setVariable ['%s',_value];";
			defaultValue = 0;
			typeName = "BOOL";
		};
		class GVAR(dud) {
			displayName = CSTRING(Dud);
			tooltip = CSTRING(Dud_Tooltip);
			property = QGVAR(dud);
			expression = "_this setVariable ['%s',_value];";
			control = "Slider";
			defaultValue = 0;
		};		
		class GVAR(fake) {
			displayName = CSTRING(Fake);
			tooltip = CSTRING(Fake_Tooltip);
			property = QGVAR(fake);
			expression = "_this setVariable ['%s',_value];";
			control = "Slider";
			defaultValue = 0;
		};
	};
};
class GVAR(Barrel_Grey):GVAR(Barrel) {
	displayName = CSTRING(BarrelGrey_DisplayName); 
	editorPreview = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_BarrelEmpty_grey_F.jpg";
	model = "\A3\Structures_F_EPB\Items\Vessels\BarrelEmpty_grey_F.p3d";
	iedd_ied_default = "Land_BarrelEmpty_grey_F";
};
