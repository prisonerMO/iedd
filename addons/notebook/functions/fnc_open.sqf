#include "script_component.hpp"
0 spawn {
	if (weaponLowered ace_player || !isNull objectParent ACE_player) then {
		continue;	
	} else {
		[ace_player] call ace_weaponselect_fnc_putWeaponAway;
		sleep 1.7;
	};
	waitUntil{sleep 0.1; !isNull (findDisplay 46)};
	createDialog QGVAR(display);
};

