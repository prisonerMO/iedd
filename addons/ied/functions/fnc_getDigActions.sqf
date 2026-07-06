#include "script_component.hpp"
/*
 * Author: Prisoner
 * Returns the actions for the buried IED dig action.
 *
 * Arguments:
 * 0: The target <OBJECT>
 *
 * Return Value:
 * Array of actions <ARRAY>
 *
 * Example:
 * [_target] call iedd_ied_fnc_getDigActions;
 *
 * Public: No
 */

params ["_target"];
TRACE_1("fnc_getDigActions",_this);

private _actions = [];

private _condition = {
    private _isDigging = _target getVariable [QGVAR(isDigging),false];
    if (_isDigging) exitWith {
        false;
    };
    _target call FUNC(canDig);
};

private _statement = {
     private _objects = attachedObjects _target;
    diag_log format ["IEDD: dig ied for helper %1, attached IED %2", _target, _objects];
    if (_objects isEqualTo []) exitWith {
        false;
    };
    private _ied = _objects select 0;
    _target setVariable [QGVAR(isDigging),true,true];
    private _bury = _ied getVariable [QGVAR(bury),[0,[0,0,0],[0,0,0],0]];
    _bury params ["_step", "", "", "_depth"];
    private _pos = getPosATL _target;
    diag_log format ["IEDD: Dig action statement executed: step=%1, depth=%2, pos=%3", _step, _depth, _pos];
    [_target, _ied, _step, _pos, _depth] call FUNC(dig);
};

private _action = [
        _target,
        LLSTRING(Dig_DisplayName),
        "",
        _statement,
        _condition,
        {},
        _target
    ] call ace_interact_menu_fnc_createAction;

_actions pushBack [_action, [], _target];

_actions
