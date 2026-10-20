#include "script_component.hpp"

[QGVAR(setVariation),LINKFUNC(setVariation)] call CBA_fnc_addEventHandler;

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
    [QGVAR(setIEDServer), LINKFUNC(setIEDServer)] call CBA_fnc_addEventHandler;

};
