#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Module function for activate IED
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call PREFIX_modules_fnc_moduleActivate
 *
 * Public: No
 */

params ["_logic"];
TRACE_1("fnc_moduleActivate",_this);

if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
private _message = "No unit selected";

if (isNull _unit) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
if !(typeOf _unit in IEDD_CLASSES) exitWith {
    _message = "Type of unit is not IED";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

[QEGVAR(ied,explosion), [_unit]] call CBA_fnc_serverEvent;
deleteVehicle _logic;
