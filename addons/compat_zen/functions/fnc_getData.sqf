#include "../script_component.hpp"
params ["_unit","_data","_player"];
[QGVAR(getData),[_unit,_data,_player]] call CBA_fnc_serverEvent;
private _data = _unit getVariable ["iedd_ied_"+_data,0];
diag_log format ["getDataFunction: %1",_data];
_data;
