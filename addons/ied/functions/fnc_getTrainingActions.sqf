#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Returns the actions for the training IED.
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
private _action = [_target, LLSTRING(Random_DisplayName), "", {[_target,true] call FUNC(resetAction)}, {true}, {}, _target] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], _target];
private _action = [_target, LLSTRING(Keep_DisplayName), "", {[_target,false] call FUNC(resetAction)}, {true}, {}, _target] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], _target];
_actions

