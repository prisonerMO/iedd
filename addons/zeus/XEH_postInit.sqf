#include "script_component.hpp"

[QGVAR(setVariation),LINKFUNC(setVariation)] call CBA_fnc_addEventHandler;

[QGVAR(setData), {
    params ["_data","_player"];
    diag_log format ["%1: %2",_player, _data];
    if (!local _player) exitWith {};
    GVAR(data) = +_data;
}] call CBA_fnc_addEventHandler;

[QGVAR(getData), {
    params ["_unit","_player"];
    if (!isServer) exitWith {};    
    {       
        private _value = _unit getVariable ["iedd_ied_"+_x, _y];
        GVAR(data) set [_x,_value]
    } forEach GVAR(data);

    diag_log format ["%1: %2",_unit, GVAR(data)];
    [QGVAR(setData),[GVAR(data), _player], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;



if (isServer) then {
    [QGVAR(setIEDServer), LINKFUNC(setIEDServer)] call CBA_fnc_addEventHandler;

};
