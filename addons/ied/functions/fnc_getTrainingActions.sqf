#include "script_component.hpp"
params ["_target"];
TRACE_1("params",_target);
private _actions = [];
private _action = [_target, LLSTRING(Random_DisplayName), "", {[_target,true] call FUNC(resetAction)}, {true}, {}, _target] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], _target];
private _action = [_target, LLSTRING(Keep_DisplayName), "", {[_target,false] call FUNC(resetAction)}, {true}, {}, _target] call ace_interact_menu_fnc_createAction;
_actions pushBack [_action, [], _target];
_actions

