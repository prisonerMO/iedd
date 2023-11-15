#include "script_component.hpp"
params ["_player","_wire", "_wireColor", "_bombObj", "_order", "_uncount"];
private _failChance = if ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist") then {
    GVAR(failChanceEOD);
} else {
	GVAR(failChance);
};
private _chance = floor (random 1);
if (_chance  < _failChance) exitWith {
	private _exploseChance = floor (random 1);
	if (_exploseChance < GVAR(failExploseChance)) then {
		[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
	};
};
deleteVehicle _wire;
[QGVAR(sound), [QGVAR(wirecut0),_player]] call CBA_fnc_globalEvent;
[
	{
		isNull (_this select 0)
	},
 	{
		params ["_wire","_bombObj","_order","_uncount"];
		private _attachedObjects = attachedObjects _bombObj;
		private _currentCount = count _attachedObjects;
		private _count = _currentCount-_uncount;
		sleep 0.05;
		if (_count isEqualTo _order) then {
			if (_count isEqualTo 0) then {
				_bombObj setVariable [QGVAR(bomb), nil, true];
				private _index = _attachedObjects findIf {typeOf _x == QEGVAR(equipment,mine_ammo)};
				if (_index isNotEqualTo -1) then {
					private _object = _attachedObjects select _index;
					deleteVehicle _object;
				};
			};
		} else {
			[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
		};
	}, 
	[_wire,_bombObj,_order,_uncount]
] call CBA_fnc_waitUntilAndExecute;





