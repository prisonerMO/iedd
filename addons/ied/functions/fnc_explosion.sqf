#include "script_component.hpp"
/*
 * Author: Prisoner
 * Handles the explosion near of an IED.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Damage <NUMBER>
 * 2: Source <OBJECT>
 *
 * Return Value:
 * Boolean
 *
 * Example:
 * [_vehicle, _damage, _source] call iedd_ied_fnc_explosion;
 *
 * Public: No
 */
params ["_vehicle", "_damage", "_source"];
TRACE_1("fnc_explosion",_this);
private _dis = false;
if (typeOf _source == "GrenadeHand") exitWith {_dis};
if ((_vehicle distance _source) < 10 && {!isNull _vehicle}) then {
    if (_vehicle getVariable QGVAR(bomb)) then {
        _vehicle setVariable [QGVAR(bomb), true, true];
    };
    _vehicle setVariable [QGVAR(dud),0,true];
    [QGVAR(explosion), [_vehicle]] call CBA_fnc_serverEvent;
    _dis = true;
};
_dis;
