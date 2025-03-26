#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Suicide bomber moving event //TO-DO description
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Waypoint [Group, Waypoint Index] <ARRAY>
 * 3: Wait Time <NUMBER>
 * 4: Previus distance <NUMBER>
 * 5: Next distance <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, player, [group bob, 1], 5, 55, 150] call iedd_ied_fnc_moveCheck
 *
 * Public: No
 */

params ["_unit","_target","_wp","_time","_next","_prev"];
TRACE_1("Move Check",_this);

if (!local _unit) exitWith {
    private _args = ((group _unit) getVariable QGVAR(suicideAct));
    [QGVAR(suicideAct), _args, _unit] call CBA_fnc_targetEvent; //if locality change?; //if locality change?
};
if (!alive _unit) exitWith {
    [group _unit] call CBA_fnc_clearWaypoints;
};
private _currentWp = _unit getVariable [QGVAR(suicideWP),nil];
if (isNil "_currentWp") exitWith{};
private _currentTarget = _unit getVariable [QGVAR(target), objNull];
private _args = ((group _unit) getVariable QGVAR(suicideAct));
if (_target != _currentTarget) exitWith {
    TRACE_1("Current Target",_currentTarget);
    _args call FUNC(suicideAct);
};
private _distance = _unit distance _target;
if ((_wp select 1) == (_currentWp select 1) && _next > 0) then {
    TRACE_3("WP,Current,Next",_wp select 1,_currentWp select 1,_next);
    if (_distance < _next || _distance > _prev) then {
        _args call FUNC(suicideAct);
    } else {
        [{call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
    };
};
