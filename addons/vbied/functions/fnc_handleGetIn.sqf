#include "..\script_component.hpp"
params ["_vehicle", "_role", "_unit", "_turret"];
if !(isPlayer _unit) exitWith {};
private _bombObj = attachedObjects _vehicle select {typeOf _x == "iedd_ied_box"};
if (isNull _bombObj) exitWith {};
private _isBomb = _bombObj getVariable ["iedd_ied_bomb", false];
if (!_isBomb) exitWith {};
_vehicle call FUNC(removeEvents);
[QEGVAR(ied,explosion), [_bombObj]] call CBA_fnc_serverEvent;