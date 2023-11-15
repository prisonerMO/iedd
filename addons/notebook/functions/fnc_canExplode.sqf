#include "script_component.hpp"
if ((curatorSelected select 0) findIf {typeOf _x in IEDD_CLASSES} != -1) exitWith {
	true;
};
false;