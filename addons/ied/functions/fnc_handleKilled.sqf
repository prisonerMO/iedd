#include "script_component.hpp"
params ["_unit", "_killer", "_instigator", "_useEffects"];

// ensure event is only called once
private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit removeEventHandler ["Killed", _killedEhId];
    private _attachedObjects = attachedObjects _unit;
    private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
    if (_index == -1) exitWith {};
    private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
    {
        private _charge = _x;
        private _isBomb = _charge getVariable [QGVAR(bomb),false];
        if (_isBomb) then {
            [QGVAR(explosion), [_charge]] call CBA_fnc_serverEvent;
        } else {
            deleteVehicle _charge;
        };
    } forEach _charges;
};


