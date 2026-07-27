#include "script_component.hpp"
/*
 * Author: Prisoner
 * Check if the player can dig the IED
 *
 * Arguments:
 * 0: player <OBJECT>
 * 1: helper <OBJECT>
 *
 * Return Value:
 * True <BOOL> - Returns true if the player can dig the IED.
 *
 * Example:
 * [ACE_player, helperObject] call iedd_ied_fnc_canDigUp;
 *
 * Public: No
 */
params [["_player", objNull, [objNull]], ["_helper", objNull, [objNull]]];
TRACE_1("fnc_canDigUp",_this);

if (isNull _player) exitWith {
    false;
};
if (isNull _helper) exitWith {
    false;
};
private _objects = attachedObjects _helper;
if (_objects isEqualTo []) exitWith {
    false;
};
private _ied = _objects select 0;
private _index = IEDD_CLASSES+IEDD_FAKE_CLASSES findIf {typeOf _ied == _x};
if (_index == -1) exitWith {
    false;
};
private _isBury = _ied getVariable [QGVAR(isBury),false];
if (!_isBury) exitWith {
    false;
};
if (GVAR(isEntrenchingTool) && {!(_player call ace_trenches_fnc_hasEntrenchingTool)}) exitWith {
    false;
};

true;

