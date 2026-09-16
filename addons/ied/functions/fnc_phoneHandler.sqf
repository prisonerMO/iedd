#include "script_component.hpp"
/*
 * Author: Prisoner
 * Add Phone Event Handler
 *
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [_ied] call iedd_ied_fnc_phoneHandler;
 *
 * Public: No
 */
params [["_ied",objNull]];
TRACE_1("fnc_addPhoneEH",_this);

if (!local (_ied)) exitWith {};
if (isNull _ied) exitWith {};

// TODO: Add phone to unit if it doesn't have one and GVAR(addPhone) is true
// private _hasPhone = QGVAR(phone) in (items _unit);
// if (!_hasPhone && GVAR(addPhone)) then {
//     _unit addItem QGVAR(phone);
// };

private _units = _ied getVariable [QGVAR(phoneUnit),[]];
if (_units isEqualTo []) exitWith {};


// _group addEventHandler ["EnemyDetected", {
// 	params ["_group", "_newTarget"];
//     private _return = false;
//     private _isPlayerGroup = _group findIf {isPlayer _x} != -1;
//     if (!_isPlayerGroup) exitWith {
//         _return;
//     };

//     private _ied = _group getVariable [QGVAR(ied), objNull];
//     if (isNull _ied) exitWith {
//         _group removeEventHandler [_thisEvent, _thisEventHandler];
//         _return;
//     };

//     private _units = units _group select {alive _x && isPlayer _x};
//     private _inArea = false;
//     {
//         private _unit = _x;
//         if (_unit distance _ied < 20) exitWith {
//             _inArea = true;
//         };
//     } forEach _units;
//     if (!_inArea) exitWith {
//         _return;
//     };

//     private _code = _ied getVariable [QGVAR(phoneCode), ""];
//     if (_code == "") exitWith {
//         _return;
//     };
//     private _unit = _group getVariable [QGVAR(unit), objNull];
//     if (isNull _unit) exitWith {
//         _return;
//     };
//     [_unit, _code] call FUNC(dialPhone);
//     _return = true;

//     _return

// }];

//Another Group Event Handler is TODO if enemyDetected not working <<-- KnowsAboutChanged
// _group addEventHandler ["KnowsAboutChanged", {
// 	params ["_group", "_targetUnit", "_newKnowsAbout", "_oldKnowsAbout"];
// }];
