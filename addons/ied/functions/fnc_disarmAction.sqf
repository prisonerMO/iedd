#include "script_component.hpp"
params ["_bombObj"];
if (!hasInterface) exitWith {};
_action = ["IEDD_DisarmMenu",LLSTRING(Disarm_DisplayName),"",{},{[_player] call FUNC(canDisarm)}] call ace_interact_menu_fnc_createAction;
[_bombObj, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;