#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Confirm handler for the ZEN "Bury IED" dialog.
 * Applies the chosen pitch/roll/yaw/depth to all matched objects, reusing fnc_buryIED.sqf
 * for the actual positioning - the same math the interactive Zeus module uses, applied at once.
 *
 * Arguments:
 * 0: Dialog return values <ARRAY>
 * 1: Objects <ARRAY> (passed through from fnc_zenOpenBuryDialog.sqf)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_values", "_objects"];
_values params ["_pitch", "_roll", "_yaw", "_depth"];

// Same pitch/roll/yaw -> vectorDir/vectorUp conversion as the Zeus module's slider handler
private _vectorDir = [
    sin(_yaw) * cos(_pitch),
    cos(_yaw) * cos(_pitch),
    sin(_pitch)
];
private _vectorUp = [
    (-sin(_roll) * cos(_yaw)) - (cos(_roll) * sin(_pitch) * sin(_yaw)),
    ( sin(_roll) * sin(_yaw)) - (cos(_roll) * sin(_pitch) * cos(_yaw)),
    cos(_roll) * cos(_pitch)
];

[QEGVAR(ied,setBury), [_objects, _depth, [_vectorDir, _vectorUp]]] call CBA_fnc_serverEvent;
