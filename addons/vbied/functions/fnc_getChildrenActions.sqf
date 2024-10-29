#include "../script_component.hpp"
params ["_target","_player","_params"];
diag_log format ["getChildrenActions CALLED %1", _this];
private _actions = [];
TRACE_3("VBIED Actions",_target,_player,_params);
private _bombObj = attachedTo _target;
private _case = _bombObj getVariable [QGVAR(casing),objNull];
//add all carried chemlight menus
if (!isNull _case) then {
    private _config = (configFile >> "CfgVehicles" >> typeOf _case); // From where
    private _icon = getText (_config >> "icon"); // Case correct pic
    private _displayName = getText (_config >> "displayName"); //DisplayName
    private _statement = {call FUNC(removeCasing)};
    private _action = [QGVAR(case), _displayName, _icon, _statement, {true}, {}, [_case]] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
};

private _active = _bombObj getVariable [QGVAR(bomb),false];
if (!_active) then {
	//Detach BOMB object
	//private _wirebox = _bombObj getVariable [QGVAR(casing),objNull];
};

_actions
