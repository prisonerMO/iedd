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
        class GVAR(iedsEmpty_SubCategory) {
            data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
            control = "SubCategory";
            displayName = CSTRING(Ieds_Category); // Visible text. Despite the attribute code saying the property should be title, displayName is correct
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
        class EGVAR(ied,Bucket):Checkbox {
            property = QGVAR(Bucket);
            displayName = ECSTRING(ied,Bucket_DisplayName);
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
        class GVAR(fakeIeds_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
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
        class Land_PlasticBucket_01_closed_F:Checkbox {
            property = QGVAR(Land_PlasticBucket_01_closed_F);
            displayName = ECSTRING(ied,Bucket_DisplayName);
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
        class GVAR(Signs_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
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
        class GVAR(Dud_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
            displayName = CSTRING(Dud_Category);
        };
        class GVAR(dud):Combo {
            property = QGVAR(dud);
            displayName = CSTRING(Dud);
            tooltip = CSTRING(Dud_Tooltip);
            defaultValue = "0.15";
            control = "Slider";
        };
/************TIMER ***********************/
        class GVAR(Timer_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
            displayName = CSTRING(Timer_Category);
        };
        class GVAR(timer) {
            displayName = CSTRING(Timer);
            tooltip = CSTRING(Timer_Tooltip);
            property = QGVAR(timer);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QEGVAR(ied,defaultTimer);
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = ECSTRING(ied,Name_Disabled);
                    value = 0;
                    default = 1;
                };
                class 2	{
                    name = ECSTRING(ied,Name_Enabled);
                    value = 1;
                };
                class 3	{
                    name = ECSTRING(ied,Name_Random);
                    value = 2;
                };
            };
        };
        /* USING CBA DEFAULTS TIMER VALUES ON COUNTDOWN TIME
        class GVAR(timerValue) {
            displayName = ECSTRING(ied,TimerValue);
            tooltip = ECSTRING(ied,TimerValue_Tooltip);
            property = QGVAR(timerValue);
            control = QEGVAR(ied,timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QEGVAR(ied,defaultTimerValue);
            typeName = "NUMBER";
        };
        class GVAR(randomTimer) {
            displayName = ECSTRING(ied,RandomTimer);
            tooltip = ECSTRING(ied,RandomTimer_Tooltip);
            property = QGVAR(randomTimer);
            control = "Combo";
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QEGVAR(ied,defaultRandomTimer);
            typeName = "NUMBER";
            class Values {
                class 1	{
                    name = ECSTRING(ied,Name_Disabled);
                    value = 0;
                };
                class 2	{
                    name = ECSTRING(ied,Name_Enabled);
                    value = 1;
                };
                class 3	{
                    name = ECSTRING(ied,Name_Random);
                    value = 2;
                };
            };
        };
        class GVAR(randomTimerMin) {
            displayName = ECSTRING(ied,RandomTimerMin);
            tooltip = ECSTRING(ied,RandomTimerMin_Tooltip);
            property = QGVAR(randomTimerMin);
            control = QEGVAR(ied,timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QEGVAR(ied,defaultTimerMin);
            typeName = "NUMBER";
        };
        class GVAR(randomTimerMax) {
            displayName = ECSTRING(ied,RandomTimerMax);
            tooltip = ECSTRING(ied,RandomTimerMax_Tooltip);
            property = QGVAR(randomTimerMax);
            control = QGVAR(timeSlider); // TODO time_slider min - max
            expression = "_this setVariable ['%s',_value];";
            defaultValue = QEGVAR(ied,defaultTimerMax);
            typeName = "NUMBER";
        };*/
/************ BLACKLIST ***********************/
        class GVAR(Blacklist_SubCategory) {
            data = "AttributeSystemSubcategory";
            control = "SubCategory";
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
