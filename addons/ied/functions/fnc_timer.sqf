#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles the timer for the IED
 *
 * Arguments:
 * 0: Bomb Object <OBJECT>
 * 1: End Time <NUMBER>
 * 2: Sound <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bombObj, 150, sound] call iedd_ied_fnc_timer
 *
 * Public: No
 */

params ["_bombObj","_endTime","_sound"];
TRACE_1("fnc_timer",_this);
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
[{call FUNC(timer);}, _this, 1] call CBA_fnc_waitAndExecute;
