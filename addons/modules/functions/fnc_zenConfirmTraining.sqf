#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Confirm handler for the ZEN "Spawn Training IED" dialog.
 * Uses the same iedd_ied_training server event as fnc_resetAction.sqf.
 *
 * Arguments:
 * 0: Dialog return values <ARRAY>
 * 1: Position <ARRAY> (ASL, passed through from fnc_zenOpenTrainingDialog.sqf)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_values", "_position"];
_values params ["_type", "_variation"];

private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
private _random = _varData select 0;
if (_variation == _random) then {
    _variation = floor (random _random);
};

// The iedd_ied_training event handler also calls setPosATL after createVehicle, which requires
// a 3-element array (unlike createVehicle's 2-element auto-snap) - convert to ATL and zero the
// height instead, which still lands exactly on the surface without erroring on the setPosATL call
_position = ASLToATL _position;
_position set [2, 0];

[QEGVAR(ied,training), [_type, _position, _variation, 0, [[0,1,0],[0,0,1]]]] call CBA_fnc_serverEvent;
