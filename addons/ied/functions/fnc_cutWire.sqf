#include "script_component.hpp"
params ["_player","_wire","_bombObj", "_order","_isFail"];
if (_isFail) exitWith {
	if (GVAR(fail)) then {
		GVAR(fail) = false;
	};
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
		params ["_wire","_bombObj","_order","_player"];
		TRACE_2("Cut",_this,GVAR(ignoreWireCutOrder));
		private _wires = _bombObj getVariable [QGVAR(wires),[]];
		private _count = count (_wires select {!isNull _x});
		private _isTimer = _bombObj getVariable [QGVAR(timer), false];
		private _defused = false;
		if (_isTimer && {
			_count == (count _wires) -1}) then {
			[QGVAR(timer), [_bombObj]] call CBA_fnc_serverEvent;
		};
		if (_count isEqualTo _order) then { // check for wrong wire cut
			if (_count isEqualTo 0) then { // all wires cut in order => bomb is defused
				_defused = true;
			};
		} else {
			if (!GVAR(ignoreWireCutOrder)) then {
				[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
				true; // when the bomb explodes => return
			};
			if (_count isEqualTo 0) then { // all wires cut with ignored order => bomb is defused
				_defused = true;
			};
		};
		if (_defused) then {
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
			[QGVAR(defused), [_player, _bombObj]] call CBA_fnc_globalEvent;
		};
	}, 
	[_wire,_bombObj,_order,_player]
] call CBA_fnc_waitUntilAndExecute;





