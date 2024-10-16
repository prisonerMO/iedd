class Logic;
class Module_F: Logic
{
	class ArgumentsBaseUnits
	{
		class Units;
	};
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

	class ModuleDescription {
		class AnyVehicle;
	};
};

class GVAR(edenModule): Module_F {
	is3DEN = 1;
	scope = 2;
	function = QFUNC(moduleEden);
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

	class ModuleDescription : ModuleDescription{};
	/*{
		description = "Short module description";	// Short description, will be formatted as structured text
		sync[] = { "AllVehicles"};				// Array of synced entities (can contain base classes)
		class AnyVehicle
		{
			description = "Short description";
			displayName = "Any Vehicle";	// Custom name
			icon = "iconMan";					// Custom icon (can be file path or CfgVehicleIcons entry)
			position = 1;	// Position is taken into effect
			direction = 1;	// Direction is taken into effect
			optional = 1;	// Synced entity is optional
			duplicate = 1;	// Multiple entities of this type can be synced
			synced[] = {"AnyVehicle" };
		};
	};*/
};