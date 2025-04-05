#include "..\script_component.hpp"
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
 * [_target] call iedd_ied_fnc_getTrainingActions;
 *
 * Public: No
 */

params ["_target"];
TRACE_1("fnc_getTrainingActions",_this);

private _actions = [];

private _condition = {
    _target getVariable [QGVAR(bury),-1] > -1
};

private _statement = {
    _target setVariable [QGVAR(isDigging),true,true];
    private _buryValue = _target getVariable [QGVAR(bury),-1];
    private _count = round(_buryValue*10);
    private _pos = getPosATL _target;
    private _depth = (getNumber (configFile >> "CfgVehicles" >> typeOf _target >> "iedd_ied_buryDepth"))*10;
    [_target, _count, _pos, _depth] call FUNC(dig)
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