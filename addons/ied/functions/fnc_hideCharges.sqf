#include "script_component.hpp"
params ["_unit","_state"];
private _attachedObjects = attachedObjects _unit;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index > -1) then {
    private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
    {
        private _charge = _x;
        private _attachedParts = attachedObjects _charge;
        if (_attachedParts isNotEqualTo []) then {
            {
                private _part = _x;
                [QGVAR(hideObject),[_part,_state]] call CBA_fnc_globalEventJIP;
            } forEach _attachedParts;
        };
        [QGVAR(hideObject),[_charge,_state]] call CBA_fnc_globalEventJIP;
    } forEach _charges;
};