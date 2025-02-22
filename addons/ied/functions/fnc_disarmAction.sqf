#include "script_component.hpp"
/*
 * Author: Prisoner
 * Adds the disarm action to an IED object.
 *
 * Arguments:
 * 0: The IED object to add the disarm action to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_bombObj] call iedd_ied_fnc_disarmAction;
 *
 * Public: No
 */
params ["_bombObj"];
TRACE_1("fnc_disarmAction",_this);
if (!hasInterface) exitWith {};
_action = ["IEDD_DisarmMenu",LLSTRING(Disarm_DisplayName),"",{},{[_player] call FUNC(canDisarm)}] call ace_interact_menu_fnc_createAction;
[_bombObj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;