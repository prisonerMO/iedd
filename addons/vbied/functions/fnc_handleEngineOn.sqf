#include "..\script_component.hpp"
params ["_vehicle", "_engineState"];
if (_engineState) then {
	//if !(isPlayer driver _vehicle) exitWith {};// only if driver is player
	private _bombObj = attachedObjects _vehicle select {typeOf _x == "iedd_ied_box"};
	if (isNull _bombObj) exitWith {};
	private _isBomb = _bombObj getVariable [QEGVAR(ied,bomb), false];
	if (!_isBomb) exitWith {};
	_vehicle call FUNC(removeEvents); //HERE on in iedd_ied_bomb.sqf?
	[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;
};