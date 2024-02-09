#include "script_component.hpp"
params ["_bombObj","_endTime","_sound"];
TRACE_4("IED Timer:",_bombObj,_endTime,_sound,time);
diag_log _this;
if (time > _endTime) exitWith {
	TRACE_1("Time > EndTime",_this);
	[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
if (isNil {_bombObj getVariable QGVAR(bomb)}) exitWith {
	TRACE_1("Defused",_bombObj getVariable QGVAR(bomb));
	deleteVehicle _sound;
};
[{_this call FUNC(timer);}, _this, 1] call CBA_fnc_waitAndExecute;


