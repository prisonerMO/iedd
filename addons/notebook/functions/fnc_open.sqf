#include "script_component.hpp"
private _isLowered = (weaponLowered ace_player || !isNull objectParent ACE_player);
if (!_isLowered) then {
	[ace_player] call ace_weaponselect_fnc_putWeaponAway;
};
private _time = [1.8,0] select _isLowered;
[{
	[{
		!isNull (findDisplay 46)
	}, {
		createDialog QGVAR(display);
	}, []] call CBA_fnc_waitUntilAndExecute;
},[], _time] call CBA_fnc_waitAndExecute;
