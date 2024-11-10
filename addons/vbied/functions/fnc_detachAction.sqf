#include "..\script_component.hpp"
params ["_box","_vehicle"];
private _condition = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_box","_vehicle"];
    !isNull _vehicle && {
        alive _vehicle && {
            alive _box
        }
    };
};

private _statement = {
    params ["_target", "_player", "_actionParams"];
    _actionParams params ["_box","_vehicle"];
    [QGVAR(detachBox), [_box,_vehicle,_player]] call CBA_fnc_serverEvent;
};

private _iedSubAction = [QGVAR(detachAction), LLSTRING(Detach_DisplayName), "", _statement, _condition,{},_this, "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
[_box, 0, ["ACE_MainActions", "IEDD_DisarmMenu"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;