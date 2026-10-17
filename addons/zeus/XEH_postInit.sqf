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
    private _dumpData = [];
    {     
        _x params ["_data", "_default"];
        private _value = _unit getVariable ["iedd_ied_"+_data, _default];
        _dumpData pushBack _value;
    } forEach [  
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
    diag_log format ["%1: %2",_unit, _dumpData];
    [QGVAR(setData),[_dumpData, _player], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
    [QGVAR(setIed), {
        params ["_bombObj","_variation","_dud","_size","_timer","_value","_dist","_typeNum","_lidState","_oce","_oc"];
        TRACE_1("IED Data:",_this);
        _bombObj setVariable ["iedd_ied_variation",_variation];
        _bombObj setVariable ["iedd_ied_dud",_dud];
        _bombObj setVariable ["iedd_ied_size",_size];
        _bombObj setVariable ["iedd_ied_timer",_timer];
        _bombObj setVariable ["iedd_ied_timerValue",_value];
        _bombObj setVariable ["iedd_ied_distance",_dist];
        if (_type == QEGVAR(ied,Bucket)) then {
            _bombObj setVariable ["iedd_ied_lidState",_lidState];
            _bombObj setVariable ["iedd_ied_openCloseEOD",_oce];
            _bombObj setVariable ["iedd_ied_openClose",_oc];
        };
    }] call CBA_fnc_addEventHandler;
};
