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

private _units = _ied getVariable [QGVAR(phoneUnits), []] select {alive _x};
if (_units isEqualTo []) exitWith {};
{
   _x playMoveNow "Acts_GrabAction"    
} forEach _units;
private _phoneArmDist = _ied getVariable [QGVAR(phoneArm), 15];

[{
    params ["_args", "_pfhID"];
    _args params ["_ied", "_units", "_phoneArmDist"];
    if (_units isEqualTo []) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };
    private _players = call CBA_fnc_players;
    {
        private _object = _x;
        private _index = _players findIf {_object distance _x < _phoneArmDist} != -1;
        if (_index) then {            
            _units call FUNC(handleArm);
            _pfhID call CBA_fnc_removePerFrameHandler;
        };
    } forEach _players;
    private _aliveUnits = _units select {alive _x};
    _args set [1, _aliveUnits];
}, 0.5, [_ied,_units,_phoneArmDist]] call CBA_fnc_addPerFrameHandler;

