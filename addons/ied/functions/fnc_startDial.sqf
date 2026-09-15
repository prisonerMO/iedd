#include "..\script_component.hpp"
/*
 * Author: ACRE2Team
 * Handles starting the phone gesture.
 *
 * Arguments:
 * 0: Unit to start phone gesture <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player] call iedd_ied_fnc_startDial
 *
 * Public: No
 */

params ["_unit"];
TRACE_1("fnc_startDial",_unit);
if (!alive _unit || {!local _unit}) exitWith {};
if (_unit getVariable [QGVAR(dialing), false]) exitWith {};
_unit setVariable [QGVAR(dialing), true];
private _pos = [0,0.02,-0.01]; //To-Do correct position
private _dir = [0.02,-0.1,0]; //To-Do correct direction
private _up = [0.6,1,-1]; //To-Do correct up
private _attached =  attachedObjects _unit;
private _isAttached = _attached findIf {typeOf _x == "iedd_ied_Phone"};
private _phone = if (_isAttached != -1) then {
   _attached select _isAttached;
} else {
   createSimpleObject ["iedd_ied_Phone" ,[0,0,0]];
};
[QGVAR(attachPhone),[_unit,_phone,_pos,_dir,_up]] call CBA_fnc_globalEvent;

_unit playActionNow QEGVAR(gestures,phone_loop);

