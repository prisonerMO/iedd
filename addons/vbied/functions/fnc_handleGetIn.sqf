#include "..\script_component.hpp"
params ["_vehicle", "_role", "_unit", "_turret"];
diag_log format["_vehicle: %1", _this];
private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(box)};
if (_index > -1) then {
	private _bombObj = _attachedObjects select _index;
	if (isNull _bombObj) exitWith {};
	private _isBomb = _bombObj getVariable [QEGVAR(ied,bomb), false];
	diag_log format["_isBomb: %1", _isBomb];
	if (!_isBomb) exitWith {};
	[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;
};