#include "script_component.hpp"
params ["_unit"];
if (GVAR(addNotebook) &&    
    {([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist")}) then {
    	[QGVAR(add),[_unit,QEGVAR(item,notebook)]] call CBA_fnc_localEvent;
};
if (GVAR(addDefusalKit) &&    
    {([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist")}) then {
    	[QGVAR(add),[_unit,"ACE_DefusalKit"]] call CBA_fnc_localEvent;
};


