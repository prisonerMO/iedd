#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add detach action to defused VBIED
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box,_vehicle] call iedd_vbied_fnc_detachAction;
 *
 * Public: No
 */

params ["_box","_vehicle"];
TRACE_1("fnc_detachAction",_this);

if (!hasInterface) exitWith {};
private _condition = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_box","_vehicle"];
    attachedTo _box isEqualTo _vehicle && {
        !isNull _vehicle && {
            alive _vehicle && {
                alive _box
            };
        };
    };
};

private _statement = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_box","_vehicle"];
    [QGVAR(detachBox), [_box,_vehicle,_player]] call CBA_fnc_serverEvent;
};

private _iedSubAction = [QGVAR(detachAction), LLSTRING(Detach_DisplayName), "", _statement, _condition,{},_this, "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;
