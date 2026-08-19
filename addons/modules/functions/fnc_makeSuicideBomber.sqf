#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Turns the given unit into a suicide bomber. Same effect as the interactive Zeus
 * "Set Suicide" module's confirm action (fnc_setSuicide.sqf), callable directly.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Variation, 0-4 real or 5+ for random <NUMBER>
 * 2: Dud chance, 0-1 <NUMBER>
 * 3: Size, 0-3 real or 4+ for random <NUMBER>
 * 4: Activation distance <NUMBER>
 * 5: Explosion distance <NUMBER>
 * 6: Sides, 4 elements each either -1 (excluded) or its own index (included) <ARRAY>
 * 7: Dead man switch <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", "_variation", "_dud", "_size", "_actDist", "_expDist", "_sides", "_isDms"];

if !(_unit isKindOf "CAManBase") exitWith {};
if !(alive _unit) exitWith {};
if (_unit getVariable [QEGVAR(ied,isCharge), false]) exitWith {};

if (_size > 3) then {
    _size = selectRandom [0, 1, 2, 3];
};

// These variables belong to the "ied" component's namespace (read by EFUNC(ied,charge) and friends),
// even though this helper - like the original Zeus module it replaces - lives in "modules"
_unit setVariable [QEGVAR(ied,isSuicide), true, true];
_unit setVariable [QEGVAR(ied,c_variation), _variation, true];
_unit setVariable [QEGVAR(ied,c_dud), _dud, true];
_unit setVariable [QEGVAR(ied,c_size), _size, true];
_unit setVariable [QEGVAR(ied,actDist), _actDist, true];
_unit setVariable [QEGVAR(ied,expDist), _expDist, true];
_unit setVariable [QEGVAR(ied,sides), _sides, true];
_unit setVariable [QEGVAR(ied,isDeadManSwitch), _isDms, true];

[QGVAR(addBombVest), [_unit, true]] call CBA_fnc_serverEvent;
_unit setVariable [QEGVAR(ied,isCharge), true, true];
[QGVAR(remove), [_unit], _unit] call CBA_fnc_targetEvent;
