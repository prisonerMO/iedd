#include "script_component.hpp"
params ["_bombObj","_endTime","_sound"];
TRACE_5("IED Timer:",_bombObj,_endTime,_sound,time,_bombObj getVariable QGVAR(bomb));
if (time > _endTime) exitWith {	
	TRACE_1("Time > EndTime",_this);
	deleteVehicle _sound;
	[QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
};
if !(_bombObj getVariable [QEGVAR(ied,bomb),false]) exitWith {
	TRACE_1("Defused",_bombObj);
	deleteVehicle _sound;
};
[{_this call FUNC(timer);}, _this, 1] call CBA_fnc_waitAndExecute;


