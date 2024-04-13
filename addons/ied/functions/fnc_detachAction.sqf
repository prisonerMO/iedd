#include "script_component.hpp"
params ["_bombObj"];
private _object = attachedTo _bombObj;
private _condition = {  
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_object"];
    !isNull _target && {
    alive _object
    };
};

private _statement = {  
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_object"];
    [QGVAR(detachCharges), [_object]] call CBA_fnc_serverEvent;
};

private _iedSubAction = [QGVAR(disarmAction), localize LSTRING(Detach_DisplayName), "", _statement, _condition,{},[_object], "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[_bombObj, 0, ["ACE_MainActions", "IEDD_DisarmMenu"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;