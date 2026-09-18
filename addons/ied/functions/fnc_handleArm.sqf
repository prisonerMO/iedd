//Handle here or somewhere else and how
#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Checks if players are x radius away from the IED with phone. If so units handleArm is called to trigger the IED.
 *
 * Arguments:
 * Object - IED <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ied] call iedd_ied_fnc_handleArm;
 *
 * Public: Yes
 */
params ["_units"];
TRACE_1("fnc_handleArm",_this);
if (_units isEqualTo []) exitWith {};
private _handle =
[{
    params ["_args", "_pfhID"];
    _args params ["_units"];
    if (_units isEqualTo []) exitWith {
        _pfhID call CBA_fnc_removePerFrameHandler;
    };        
    private _isDialing= _units findIf {(_x getVariable [QGVAR(dialing), false])};
    if (_isDialing != -1) then {
        private _unit = _units select 0;
        _unit call FUNC(dialPhone);
    };
    private _aliveUnits = _units select {alive _x};
    _args set [1, _aliveUnits];
}, 1, [_units]] call CBA_fnc_addPerFrameHandler;
