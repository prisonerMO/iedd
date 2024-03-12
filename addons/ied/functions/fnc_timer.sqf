#include "script_component.hpp"
params ["_bombObj","_endTime","_sound"];
TRACE_5("IED Timer:",_bombObj,_endTime,_sound,serverTime,isNil {_bombObj getVariable QGVAR(bomb)});
if (serverTime > _endTime) exitWith {
	TRACE_1("Time > EndTime",_this);
	deleteVehicle _sound;
	[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
if (isNil {_bombObj getVariable QGVAR(bomb)}) exitWith {
	TRACE_1("Defused",_bombObj);
	deleteVehicle _sound;
};
[{_this call FUNC(timer);}, _this, 1] call CBA_fnc_waitAndExecute;


