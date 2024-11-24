#include "script_component.hpp"
params ["_bombObj"];
if (!(_bombObj getVariable [QEGVAR(ied,bomb),false])) exitWith {};
_bombObj setVariable [QGVAR(bomb),false,true];
private _isTraining = _bombObj getVariable [QGVAR(training), false];
if (_isTraining) then {
	private _type = IEDD_TRAINING_BOMB;
	private _pos = _bombObj modelToWorld [0,0,0];
	[
		{
			params ["_bombObj","",""];
			!isNull _bombObj;
		},
		{
			params ["_bombObj","_pos","_type"];
			_bomb = createVehicle [_type, [_pos #0, _pos #1, 0.1], [], 0, "CAN_COLLIDE"];
			[QGVAR(hideObject),[_bomb,true]] call CBA_fnc_globalEvent;
			_bomb setDamage 1;
			//triggerAmmo _bomb;
		},
		[_bombObj,_pos,_type]
	] call CBA_fnc_waitUntilAndExecute;
} else {
	private _possiblity = _bombObj getVariable [QGVAR(dud), GVAR(defaultDud)];
	if (_possiblity > random 1 || GVAR(isDuds)) then {
		private _sound = format ["iedd_ied_dud%1", floor (random 4)];
		[QGVAR(dudEffect),[_bombObj,_sound]] call CBA_fnc_globalEvent;
		private _attachedObjects = attachedObjects _bombObj;
		private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge_Ammo)};
		if (_index > -1) then {
			private _object = _attachedObjects select _index;
			deleteVehicle _object;
		};
		if (typeOf _bombObj == QGVAR(Charge)) then {
			private _unit = attachedTo _bombObj;
			private _isSuicide = _unit getVariable [QGVAR(isSuicide),false];
			if (_isSuicide) then {
				_unit setVariable [QGVAR(isSuicide),true,true];
				_unit setVariable [QGVAR(suicideWP), nil,true];
				if (alive _unit) then {
					private _group = group _unit;
					[_group] call CBA_fnc_clearWaypoints;
					_unit enableAI "PATH";
					[_group, _group, 250, 5, "MOVE", "AWARE", "GREEN", "NORMAL", "STAG COLUMN", "", [5, 6, 7]] call CBA_fnc_taskPatrol;
				};
			};
		};
	} else {
		private _pos = getPosATL _bombObj;
		_pos set [2,0.05];
		private _size = _bombObj getVariable [QGVAR(size), 3];
		private _unit = objNull;
		if (_size > 4) then {
			_size = floor (random 4);
		};
		private _type =  selectRandom (IEDD_BOMB_SIZE select _size);
		if (typeOf _bombObj == QGVAR(Charge)) then {
			_unit = attachedTo _bombObj;
			private _attachedObjects = attachedObjects _unit;
			private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
			if (_index > -1) then {
				[_unit] call FUNC(removeEvents);
				private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
				{
					deleteVehicle _x;
				} forEach _charges;
			};
		} else {
			deleteVehicle _bombObj;
		};
		[
			{
				params ["_bombObj","",""];
				isNull _bombObj;
			},
			{
				params ["_bombObj","_pos","_type"];
				_bomb = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
				//[QGVAR(hideObject),[_bomb,true]] call CBA_fnc_globalEvent;
				//_bomb setDamage 1;
				triggerAmmo _bomb;
				if (!isNull _unit) then {
					[{
						params ["_unit"];
						if (alive _unit) then {_unit setDamage 1};
					},[_unit], 0.2] call CBA_fnc_waitAndExecute;
				};
			},
			[_bombObj,_pos,_type,_unit]
		] call CBA_fnc_waitUntilAndExecute;
	};
};