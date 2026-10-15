#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles speed of vehicle event, until detached. If speed is greater than 45, trigger the IED.
 *
 * Arguments:
 * 0: The ied object <OBJECT>
 * 1: The vehicle object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ied, _veh] call iedd_ied_fnc_vehicleCheck;
 *
 * Public: No
 */

params ["_ied", "_veh"];
private _ieds = _veh getVariable [QGVAR(attachedIEDs),[]];
_ieds pushBackUnique _ied;
_veh setVariable [QGVAR(attachedIEDs), _ieds];
private _speedPFH = _veh getVariable [QGVAR(speedPFH),-1];
if (_speedPFH > -1) exitWith {};
_speedPFH = 
[{
    params ["_args", "_pfhID"];
    _args params ["_veh"];
    private _speed = speed _veh;
    if (_speed > 45|| _speed < -45)  then {
        private _ieds = _veh getVariable [QGVAR(attachedIEDs),[]];
        {
            [QGVAR(explosion), [_x]] call CBA_fnc_serverEvent;
        } forEach _ieds;
        _pfhID call CBA_fnc_removePerFrameHandler;
    };
}, 0.5, [_veh]] call CBA_fnc_addPerFrameHandler;
_veh setVariable [QGVAR(speedPFH), _speedPFH];
