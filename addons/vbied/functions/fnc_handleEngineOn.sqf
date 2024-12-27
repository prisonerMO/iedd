#include "..\script_component.hpp"
params ["_vehicle", "_engineState"];
diag_log format["_vehicle engineOn: %1", _this];
private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(box)};
if (_index > -1) then {
	private _bombObj = _attachedObjects select _index;
	private _isBomb = _bombObj getVariable [QEGVAR(ied,bomb), false];
	if (!_isBomb) exitWith {};
	[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
