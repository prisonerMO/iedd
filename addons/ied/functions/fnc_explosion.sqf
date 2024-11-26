#include "script_component.hpp"
params ["_vehicle", "_damage", "_source"];
private _dis = false;
if (typeOf _source == "GrenadeHand") exitWith {_dis};
if ((_vehicle distance _source) < 10 && {!isNull _vehicle}) then {
    if !(_vehicle getVariable [QGVAR(bomb),false]) then {
        _vehicle setVariable [QGVAR(bomb), true, true];
    };
    _vehicle setVariable [QGVAR(dud),0,true];
    [QGVAR(explosion), [_vehicle]] call CBA_fnc_serverEvent;
    _dis = true;
};
_dis;
