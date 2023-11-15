class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits
		{
			class Units;
		};
		class ModuleDescription;
		class AttributesBase
		{
			class Default;
			class Edit;
			class Combo;
			class Checkbox;
			class CheckboxNumber;
			class ModuleDescription;
			class Units;
		};
	};

class GVAR(multi): Module_F {
	is3DEN = 1;	
	scope = 2;
	function = QFUNC(multi);
	functionPriority = 25;
	canSetArea = 1;
	canSetAreaHeight = 0;
	canSetAreaShape = 1;
	vehicleClass = "Modules";
    category = QGVAR(Modules);
	isGlobal = 1;
	displayName = CSTRING(Multi_DisplayName);
	icon = QPATHTOF(UI\moduleicon.paa);
	
	class AttributeValues {
		size3[]={500,500,-1};
		isRectangle=0;
	};
	class AttributesBase:AttributesBase {
		class GVAR(SubTitle):Default {
			defaultValue = "''";
			control = QGVAR(subTitle);
			property = QGVAR(__LINE__);
            displayName = "";
		};
	};
	class Attributes: AttributesBase {

/************ IEDS ***********************/
		class GVAR(iedsEmpty):GVAR(SubTitle) {
			property = QGVAR(iedsEmpty);
            displayName = "";
		};
		class GVAR(iedsSubTitle):GVAR(SubTitle) {
			property = QGVAR(countSubTitle);
            displayName = CSTRING(Ieds_Category);
		};	
		class EGVAR(ied,CanisterPlastic):Checkbox {
			property = QGVAR(CanisterPlastic);
			displayName = ECSTRING(ied,PlasticCanister_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class EGVAR(ied,CanisterFuel):Checkbox {
			property = QGVAR(CanisterFuel);
			displayName = ECSTRING(ied,FuelCanister_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};		
		class EGVAR(ied,Cardboard):Checkbox {
			property = QGVAR(Cardboard);
			displayName = ECSTRING(ied,Cardboard_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class EGVAR(ied,Cinder):Checkbox {
			property = QGVAR(Cinder);
			displayName = ECSTRING(ied,Cinder_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class EGVAR(ied,Barrel):Checkbox {
			property = QGVAR(Barrel);
			displayName = ECSTRING(ied,Barrel_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};		
		class EGVAR(ied,Metal):Checkbox {
			property = QGVAR(Metal);
			displayName = ECSTRING(ied,MetalBarrel_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class GVAR(count):Default {
			property = QGVAR(count);
			displayName = CSTRING(Count);
			tooltip = CSTRING(Count_Tooltip);
			control = "EditShort";
			typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			defaultValue = 2;
		};
		
/************ FAKE IED ***********************/
		class GVAR(fakeIedsEmpty):GVAR(SubTitle) {
			property = QGVAR(fakeIedsEmpty);
            displayName = "";
		};

		class GVAR(fakeIedsSubTitle):GVAR(SubTitle) {
			property = QGVAR(fakeIedsSubTitle);
            displayName = CSTRING(Fake_Category);
		};

		class Land_CanisterPlastic_F:Checkbox {
			property = QGVAR(CanisterPlastic_F);
			displayName = ECSTRING(ied,PlasticCanister_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class Land_CanisterFuel_F:Checkbox {
			property = QGVAR(CanisterFuel_F);
			displayName = ECSTRING(ied,FuelCanister_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};		
		class Land_PaperBox_01_small_ransacked_brown_F:Checkbox {
			property = QGVAR(PaperBox_01_small_ransacked_brown_F);
			displayName = ECSTRING(ied,Cardboard_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class Land_CinderBlock_01_F:Checkbox {
			property = QGVAR(CinderBlock_01_F);
			displayName = ECSTRING(ied,Cinder_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class Land_GarbageBarrel_01_F:Checkbox {
			property = QGVAR(GarbageBarrel_01_F);
			displayName = ECSTRING(ied,Barrel_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};		
		class Land_BarrelEmpty_F:Checkbox {
			property = QGVAR(BarrelEmpty_F);
			displayName = ECSTRING(ied,MetalBarrel_DisplayName);
			tooltip = CSTRING(Type_Tooltip);
			defaultValue = 1;
		};
		class GVAR(fakeCount):Default {
			property = QGVAR(fakeCount);
			displayName = CSTRING(FakeCount);
			tooltip = CSTRING(FakeCount_Tooltip);
			control = "EditShort";
			typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			defaultValue = 4;
		};
/************ GROUND SIGNS ***********************/
		class GVAR(signsEmpty):GVAR(SubTitle) {
			property = QGVAR(signsEmpty);
            displayName = "";
		};
		class GVAR(signsSubTitle):GVAR(SubTitle) {
			property = QGVAR(signsSubTitle);
            displayName = CSTRING(Signs_Category);
		};		
		class GVAR(signs):Checkbox {
			property = QGVAR(signs);
			displayName = CSTRING(Signs);
			tooltip = CSTRING(Signs_Tooltip);
			defaultValue = 1;
		};
		class GVAR(extraSigns):Checkbox {
			property = QGVAR(extraSigns);
			displayName = CSTRING(ExtraSigns);
			tooltip = CSTRING(ExtraSigns_Tooltip);
			defaultValue = 1;
		};
		class GVAR(fakeSigns):Checkbox {
			property = QGVAR(fakeSigns);
			displayName = CSTRING(FakeSigns);
			tooltip = CSTRING(FakeSigns_Tooltip);
			defaultValue = 1;
		};
		class GVAR(extraCount):Default {
			property = QGVAR(extraGroundSigns);
			displayName = CSTRING(ExtraCount);
			tooltip = CSTRING(ExtraCount_ToolTip);
			control = "EditShort";
			typeName = "NUMBER"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			defaultValue = "0";
		};
/************DUDS ***********************/
		class GVAR(dudEmpty):GVAR(SubTitle) {
			property = QGVAR(dudEmpty);
            displayName = "";
		};
		class GVAR(dudSubTitle):GVAR(SubTitle) {
			property = QGVAR(dudSubTitle);
            displayName = CSTRING(Dud_Category);
		};
		class GVAR(dud):Combo {
			property = QGVAR(dud);
			displayName = CSTRING(Dud);
			tooltip = CSTRING(Dud_Tooltip);
			defaultValue = "0.15";
			control = "Slider";
		};
/************ BLACKLIST ***********************/
		class GVAR(blackEmpty):GVAR(SubTitle) {
			property = QGVAR(blackEmpty);
            displayName = "";
		};
		class GVAR(blackSubTitle):GVAR(SubTitle) {
			property = QGVAR(blackSubTitle);
            displayName = CSTRING(Blacklist_Category);
		};	
		class GVAR(black):Default {
			property = QGVAR(black);
			control = "Edit";
			displayName = CSTRING(Blacklist);
			description = "markerarea";
			tooltip = CSTRING(Blacklist_Tooltip);
			typeName = "STRING"; // Value type, can be "NUMBER", "STRING" or "BOOL"
			defaultValue = "''";
		};
	};
	class ModuleDescription: ModuleDescription {};
/*	class Arguments: ArgumentsBaseUnits	{
		class Units: Units{};
		class CheckTest
		{
			displayName = "CheckTest";
			description = "";
			typeName = "NUMBER";
			defaultValue = 1;
		};
	};
*/
};
