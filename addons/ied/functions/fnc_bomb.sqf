#include "script_component.hpp"
params ["_bombObj"];
if (isNil {_bombObj getVariable QGVAR(bomb)}) exitWith {};
private _possiblity = _bombObj getVariable [QGVAR(dud), GVAR(defaultDud)];
if (_possiblity > random 1 || GVAR(isDuds)) then {
	_bombObj setVariable [QGVAR(bomb),nil,true];
	[QGVAR(dudEffect),[_bombObj]] call CBA_fnc_globalEvent;
	private _attachedObjects = attachedObjects _bombObj;
	private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge_Ammo)};
	if (_index isNotEqualTo -1) then {
		private _object = _attachedObjects select _index;
		deleteVehicle _object;
	};
} else {
	if (typeOf _bombObj == QGVAR(Charge)) then {
		detach _bombObj;
	};
	private _pos = _bombObj modelToWorld [0,0,0];
	private _size = _bombObj getVariable [QGVAR(size), 2];
	if (_size > 3) then {
		_size = floor (random 3);		
	};
	private _type =  selectRandom (IEDD_BOMB_SIZE select _size);
	deleteVehicle _bombObj;
	[
		{
			params ["_bombObj","",""];
			isNull _bombObj;
		}, 
		{
			params ["_bombObj","_pos","_type"];
			_bomb = createVehicle [_type, [_pos #0, _pos #1, 0.05], [], 0, "CAN_COLLIDE"];
			[QGVAR(hideObject),[_bomb,true]] call CBA_fnc_globalEvent;
			_bomb setDamage 1;
		}, 
		[_bombObj,_pos,_type]
	] call CBA_fnc_waitUntilAndExecute;
};


