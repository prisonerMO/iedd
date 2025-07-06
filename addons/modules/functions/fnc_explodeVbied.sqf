#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Module function for explode VBIED
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Logic] call iedd_modules_fnc_explodeVbied
 *
 * Public: No
 */

params ["_logic"];
TRACE_1("fnc_explodeVbied",_this);

if !(local _logic) exitWith {};

private _vehicle = attachedTo _logic;
private _message = "No unit selected";
if (isNull _vehicle) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

if (typeOf _vehicle == QEGVAR(vbied,box)) exitWith {
    [QGVAR(explode), [_vehicle]] call CBA_fnc_serverEvent;
    deleteVehicle _logic;
};

private _allVehicles = entities [["LandVehicle","Air","Ship"], []];
if !(_vehicle in _allVehicles) exitWith { //Check vehicle , how
    _message = "Type of unit is not vehicle";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
/*if (!alive _vehicle) exitWith {
    _message = "Vehicle is not alive";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};*/
private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QEGVAR(vbied,box)};
if (_index == -1) exitWith {
    _message = "No VBIED attached to vehicle";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
private _object = _attachedObjects select _index;
[QGVAR(explode), [_object]] call CBA_fnc_serverEvent;
deleteVehicle _logic;
