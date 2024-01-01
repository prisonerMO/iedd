#include "script_component.hpp"
params ["_unit","_status"];
if (!local _unit) exitWith {};
private _attachedObjects = attachedObjects _unit;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index == -1) exitWith {};
private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
if (_status) then {
    {
        private _charge = _x;
        private _attachedObjects = attachedObjects _charge;
        if (_attachedObject isNotEqualTo []) then {
            {
                private _part = _x;
                [QGVAR(hideObject),[_part,true]] call CBA_fnc_globalEventJIP;
            } forEach _iedParts;
        };
        [QGVAR(hideObject),[_charge,true]] call CBA_fnc_globalEventJIP;
    } forEach _charges;
} else {
    {
        private _charge = _x;
        private _attachedObjects = attachedObjects _charge;
        if (_attachedObject isNotEqualTo []) then {
            {
                private _part = _x;
                [QGVAR(hideObject),[_part,false]] call CBA_fnc_globalEventJIP;
            } forEach _iedParts;
        };
        [QGVAR(hideObject),[_charge,false]] call CBA_fnc_globalEventJIP;
    } forEach _charges;
};