#include "script_component.hpp"
params ["_player","_wire", "_wireColor", "_bombObj", "_order"];
private _failChance = if ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist") then {
    GVAR(failChanceEOD);
} else {
	GVAR(failChance);
};
private _chance = random 1;
if (_chance < _failChance) exitWith {
	private _exploseChance = random 1;
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
		params ["_wire","_bombObj","_order"];
		private _wires = _bombObj getVariable [QGVAR(wires),[]];
		private _count = count (_wires select {!isNull _x});
		if (_count isEqualTo _order) then {
			if (_count isEqualTo 0) then {
				_bombObj setVariable [QGVAR(bomb), nil, true];
				private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge_Ammo)};
				if (_index isNotEqualTo -1) then {
					private _object = _attachedObjects select _index;
					deleteVehicle _object;
				};
				if (typeOf _bombObj == QGVAR(Charge)) then {
					private _object = attachedTo _bombObj;
					[QGVAR(defused), [_object]] call CBA_fnc_serverEvent; 
				};
			};
		} else {
			[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
		};
	}, 
	[_wire,_bombObj,_order]
] call CBA_fnc_waitUntilAndExecute;





