#include "script_component.hpp"
[QGVAR(setData), {
    params ["_unit","_data","_value"];
    _unit setVariable ["iedd_ied_"+_data,_value];
}] call CBA_fnc_addEventHandler;

[QGVAR(getData), {
    params ["_unit","_data","_player"];
    private _value = _unit getVariable ["iedd_ied_"+_data,0];
    [QGVAR(setData),[_unit,_data,_value], _player] call CBA_fnc_targetEvent;
}] call CBA_fnc_addEventHandler;
            