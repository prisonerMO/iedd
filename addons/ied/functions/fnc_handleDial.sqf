//Handle here or somewhere else and how
#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Checks if players are x radius away from the IED with phone. If so units handleDial is called to trigger the IED.
 *
 * Arguments:
 * Object - IED <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ied] call iedd_ied_fnc_handleDial;
 *
 * Public: Yes
 */
params ["_ied"];
TRACE_1("fnc_handleDial",_this);
private _units = _ied getVariable [QGVAR(phoneUnits), []];
if (_units isEqualTo []) exitWith {};

private _armDist = _ied getVariable [QGVAR(phoneArm), 15];
private _handle =
[{
    params ["_args", "_pfhID"];
    _args params ["_ied", "_units", "_armDist"];
    if (_units isEqualTo []) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };
    private _players = call CBA_fnc_players;
    {
        private _object = _x;
        private _index = _players findIf {_object distance _x < _armDist} != -1;
        if (_index) then {            
            {
                private _isCalling = _units findIf {(_x getVariable [QGVAR(phoneCalling), false])};
                if (_isCalling > -1) then {
                    continue;
                };
                private _unit = _x;
                _unit call FUNC(dialPhone);
            } forEach _units;
        };
    } forEach _players;
    private _aliveUnits = _units select {alive _x};
    _args set [1, _aliveUnits];
}, 0.5, [_ied,_units,_armDist]] call CBA_fnc_addPerFrameHandler;
