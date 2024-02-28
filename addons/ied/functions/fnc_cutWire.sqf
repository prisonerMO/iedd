#include "script_component.hpp"
params ["_player","_wire","_bombObj", "_order"];
private _failChance = [iedd_ied_failChance, iedd_ied_failChanceEOD] select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
TRACE_1("FailChance",_failChance);
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
		private _isTimer = _bombObj getVariable [QGVAR(timer),false];
		if (_isTimer && {
			_count == count _wires -1}) then {
			[QGVAR(timer), [_bombObj]] call CBA_fnc_serverEvent;
		};
		if (_count isEqualTo _order) then {
			if (_count isEqualTo 0) then {
				_bombObj setVariable [QGVAR(bomb), nil, true];
				private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge_Ammo)};
				if (_index isNotEqualTo -1) then {
					private _object = _attachedObjects select _index;
					deleteVehicle _object;
				};
				if (typeOf _bombObj == QGVAR(Charge)) then {
					private _unit = attachedTo _bombObj;				
					[QGVAR(detachAction), [_bombObj]] call CBA_fnc_globalEventJIP;
					[_unit] call FUNC(removeEvents);
				};
			};
		} else {
			[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
		};
	}, 
	[_wire,_bombObj,_order]
] call CBA_fnc_waitUntilAndExecute;





