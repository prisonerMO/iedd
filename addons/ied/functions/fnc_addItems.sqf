#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add items IEDD Notebook and Defusal Kit to the unit if settings is enabled
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call iedd_ied_fnc_addItems
 *
 * Public: No
 */
params ["_unit"];
TRACE_1("fnc_addItems",_this);
if (GVAR(addNotebook) &&    
    {([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist")}) then {
    	[QGVAR(add),[_unit,"iedd_item_notebook"]] call CBA_fnc_localEvent;
};
if (GVAR(addDefusalKit) &&    
    {([_unit] call ace_common_fnc_isEOD || _unit getUnitTrait "explosiveSpecialist")}) then {
    	[QGVAR(add),[_unit,"ACE_DefusalKit"]] call CBA_fnc_localEvent;
};