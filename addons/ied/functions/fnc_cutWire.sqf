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
		if (_count == _order) then { // check for wrong wire cut
			if (_count == 0) then { // all wires cut in order => bomb is defused
				_defused = true;
			};
		} else {
			if (!GVAR(ignoreWireCutOrder)) then {
				[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
				true; // when the bomb explodes => return
			};
			if (_count == 0) then { // all wires cut with ignored order => bomb is defused
				_defused = true;
			};
		};
		if (_defused) then {
			_bombObj setVariable [QGVAR(bomb), false, true];
			private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge_Ammo)};
			if (_index > -1) then {
				private _object = _attachedObjects select _index;
				deleteVehicle _object;
			};
			private _typeOf = typeOf _bombObj;
			if (_typeOf == QGVAR(Charge)) then {
				private _unit = attachedTo _bombObj;
				private _jipId = [QGVAR(detachAction), [_bombObj]] call CBA_fnc_globalEventJIP;
            	[_jipID, _bombObj] call CBA_fnc_removeGlobalEventJIP;
				[QGVAR(events), [_unit]] call CBA_fnc_serverEvent;
			};
			if (_typeOf == QEGVAR(vbied,box)) then {
				private _vehicle = attachedTo _bombObj;
				[QEGVAR(vbied,events), [_vehicle]] call CBA_fnc_serverEvent;
				private _jipId = [QEGVAR(vbied,detachAction), [_bombObj,_vehicle]] call CBA_fnc_globalEventJIP;
            	[_jipID, _bombObj] call CBA_fnc_removeGlobalEventJIP;
			};
			[QGVAR(defused), [_player, _bombObj]] call CBA_fnc_globalEvent;
		};
	},
	[_wire,_bombObj,_order,_player]
] call CBA_fnc_waitUntilAndExecute;





