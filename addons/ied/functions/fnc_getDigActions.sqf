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
    [_player,_target] call FUNC(canDigUp);
};

private _statement = {
    params ["_target", "_player", "_actionParams"];
    private _objects = attachedObjects _target;
    diag_log format ["IEDD: dig ied for helper %1, attached IED %2", _target, _objects];
    if (_objects isEqualTo []) exitWith {
        false;
    };    
    private _ied = _objects select 0;
    private _hasWpn = currentWeapon _player != "";
    private _checkTime = [0,1.8] select (_hasWpn);
    if (_hasWpn) then {
        [_player] call ace_weaponselect_fnc_putWeaponAway;
    };
    [{
        call FUNC(continueDigUp);        
    }, [_player,_target,_ied], _checkTime] call CBA_fnc_waitAndExecute;
};

private _action = [
        _target,
        LLSTRING(DigUp_DisplayName),
        "",
        _statement,
        _condition,
        {},
        _target
    ] call ace_interact_menu_fnc_createAction;

_actions pushBack [_action, [], _target];

_actions
