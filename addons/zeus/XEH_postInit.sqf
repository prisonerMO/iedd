#include "script_component.hpp"
[QGVAR(setData), {
    params ["_data","_player"];
    diag_log format ["%1: %2",_player, _data];
    if (!local _player) exitWith {};
    GVAR(data) = _data;
}] call CBA_fnc_addEventHandler;

[QGVAR(getData), {
    params ["_unit","_player"];
    if (!isServer) exitWith {};
    {
        _x params ["_data","_default"];
        private _value = _unit getVariable ["iedd_ied_"+_data,_default];
        GVAR(data) set [_data,_value];
    } forEach [
        ["color",""],
        ["dist",0],
        ["dud",0],
        ["size",0],
        ["timer",false],
        ["timerValue",0],
        ["variation",0],
        ["lidState",false],
        ["oce",0],
        ["oc",0]
    ];
    diag_log format ["%1: %2",_unit, GVAR(data)];
    [QGVAR(setData),[GVAR(data), _player], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
if (!hasInterface) exitWith {};
