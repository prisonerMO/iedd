#include "script_component.hpp"
params ["_unit","_status"];
if (!local _unit) exitWith {};
private _attachedObjects = attachedObjects _unit;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index == -1) exitWith {};
if (_status) then {
    _unit setDamage 1;
};