#include "..\script_component.hpp"
params ["_unit", "_killer", "_instigator", "_useEffects"];
TRACE_1("HandleKilled Bomb Vest",_unit);
// ensure event is only called once
private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit removeEventHandler ["Killed", _killedEhId];
    private _attachedObjects = attachedObjects _unit;
    private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
    if (_index > -1) then {
        private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
        {
            private _charge = _x;
            private _isBomb = _charge getVariable [QGVAR(bomb),false];
            TRACE_1("is Bomb",_isBomb);
            if (_isBomb) then {
                [{[QGVAR(explosion), _this] call CBA_fnc_serverEvent;}, [_charge], 0.5] call CBA_fnc_waitAndExecute;

            };
        } forEach _charges;
    };
};