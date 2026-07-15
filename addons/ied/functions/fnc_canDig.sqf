#include "script_component.hpp"
/*
 * Author: Prisoner
 * Check if the player can dig the IED
 *
 * Arguments:
 * 0: helper <OBJECT>
 *
 * Return Value:
 * True <BOOL> - Returns true if the player can dig the IED.
 *
 * Example:
 * [helper] call iedd_ied_fnc_canDig;
 *
 * Public: No
 */
 params ["_helper"];
 TRACE_1("fnc_canDig",_this);
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
_isBury;
