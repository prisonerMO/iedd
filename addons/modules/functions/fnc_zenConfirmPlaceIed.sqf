#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Confirm handler for the ZEN "Spawn IED" dialog.
 * Spawns the selected IED at the position the ZEN context menu was opened at.
 * Uses the same iedd_modules_createIed server event as the vanilla "Place IED" Zeus module.
 *
 * Arguments:
 * 0: Dialog return values <ARRAY>
 * 1: Position <ARRAY> (ASL, passed through from fnc_zenOpenPlaceDialog.sqf)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_values", "_position"];
_values params ["_typeNum", "_variation", "_size", "_dud", "_dist", "_timer", "_value"];

private _types = call FUNC(zenIedTypes);
private _type = (_types select _typeNum) select 0;

// Resolve "Random" variation the same way the Zeus module dialog does (fnc_setIed.sqf)
private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
private _random = _varData select 0;
if (_variation == _random) then {
    _variation = floor (random _random);
};

_dist = round _dist;
_value = round _value;

// Drop to a 2D position so createVehicle snaps the IED directly onto the surface
// instead of using ZEN's cursor-ray Z as-is, which can leave it a hair above ground
_position resize 2;

// Bucket lid state/open-close are not exposed here, matching the current Zeus module dialog's controls
[QGVAR(createIed), [_type, _position, _variation, _dud, _size, _timer, _value, _dist, _typeNum, -1, 0, 0]] call CBA_fnc_serverEvent;
