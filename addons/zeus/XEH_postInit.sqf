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
    private _dumpData = createHashMapFromArray [
        ["color",""],
        ["dist",0],
        ["dud",0],
        ["size",0],
        ["timer",false],
        ["timerValue",0],
        ["variation",0],
        ["lidState",false],
        ["openClose",0],
        ["openCloseEOD",0]
    ];
    {     
        private _value = _unit getVariable ["iedd_ied_"+_x,_y];
        _dumpData set [_x, _value];
    } forEach _dumpData;
    diag_log format ["%1: %2",_unit, _dumpData];
    [QGVAR(setData),[_dumpData, _player], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(setServerData), {
        params ["_unit","_data"];
        {
            private _key = _x;
            private _value = _data get _key;
            _unit setVariable ["iedd_ied_"+_key,_value];
        } forEach _data;
        diag_log format ["%1: %2",_unit, _data];
    }] call CBA_fnc_addEventHandler;
};
