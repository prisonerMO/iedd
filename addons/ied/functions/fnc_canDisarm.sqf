#include "script_component.hpp"
params ["_player"];
if (!isNil QGVAR(failSound)) exitWith { 
	false;
};
if (GVAR(isEOD) &&
	{!([_player] call ace_common_fnc_isEOD) &&
	{!(_player getUnitTrait "explosiveSpecialist")}}) exitWith {
	false;
};
if (GVAR(isDefusalKit) && 
	{!("ACE_DefusalKit" in (items _player))}) exitWith { 
	false; 
};
true;

