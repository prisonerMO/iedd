#include "script_component.hpp"
params ["_logic"];

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

if !(_unit getVariable [QEGVAR(ied,bomb),false]) then {
	_unit setVariable [QEGVAR(ied,bomb), true, true];
};
_unit setVariable [QEGVAR(ied,dud),0,true];	
[QEGVAR(ied,explosion), [_unit]] call CBA_fnc_serverEvent;
deleteVehicle _logic;