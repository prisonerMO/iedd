#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Adds the detach action to an IED object.
 *
 * Arguments:
 * 0: The IED object to add the detach action to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_bombObj] call iedd_ied_fnc_detachAction;
 *
 * Public: No
 */

params ["_bombObj"];
TRACE_1("fnc_detachAction",_this);

if (!hasInterface) exitWith {};
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

private _iedSubAction = [QGVAR(disarmAction), LLSTRING(Detach_DisplayName), "", _statement, _condition,{},[_object], "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[_bombObj, 0, ["ACE_MainActions", "IEDD_DisarmMenu"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;