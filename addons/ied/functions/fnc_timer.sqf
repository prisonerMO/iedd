#include "script_component.hpp"
params ["_bombObj","_endTime","_sound"];
diag_log format ["Timer Current objects %1, Time: %2", _this,time];
if (time > _endTime) exitWith {
	[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
if (isNil {_bombObj getVariable QGVAR(bomb)}) exitWith {
	deleteVehicle _sound;
};
[FUNC(timer), [], 1] call CBA_fnc_waitAndExecute;


