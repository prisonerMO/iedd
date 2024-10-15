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

class GVAR(edenModule): Module_F {
	is3DEN = 1;
	scope = 2;
	function = QFUNC(edenModule);
	functionPriority = 25;
	isSingular = 1;
	vehicleClass = "Modules";
    category = QEGVAR(modules,Modules);
	isGlobal = 1;
	displayName = CSTRING(Vbied_DisplayName);
	icon = QPATHTOEF(modules,UI\moduleicon.paa);
	class Attributes: AttributesBase {
        /***SETUP***/
        class GVAR(Main_SubCategory) {
            data = "AttributeSystemSubcategory"; // This is needed for the attribute to work
            control = "SubCategory";
            displayName = "TEST"; // Visible text. Despite the attribute code saying the property should be title, displayName is correct
        };
        class GVAR(test):Checkbox {
            property = QGVAR(test);
            displayName = "TEST";
            tooltip = "TEST";
            defaultValue = 1;
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