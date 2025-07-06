#include "script_component.hpp"
/*
 * Author: Prisoner
 * Adds dud wires to an IED object.
 *
 * Arguments:
 * 0: The IED object to add the dud wires to <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_bombObj] call iedd_ied_fnc_dudWires;
 *
 * Public: No
 */

params ["_bombObj"];
TRACE_1("fnc_dudWires",_this);

private _ieddWires = _bombObj getVariable [QGVAR(wires),[]];
if (_ieddWires isEqualTo []) exitWith {TRACE_1("No wires saved on object.",_bombObj);};
private _type = typeOf _bombObj;
private _wires = switch (_type) do {
    case QGVAR(CanisterFuel): {IEDD_DUDS_JERRY};
    case QGVAR(CanisterPlastic): {IEDD_DUDS_CAN};
    case QGVAR(Cardboard): {IEDD_DUDS_CARDBOARD};
    case QGVAR(Cinder): {IEDD_DUDS_CINDER};
    case QGVAR(Metal): {IEDD_DUDS_METAL};
    case QGVAR(Metal_English): {IEDD_DUDS_METAL};
    case QGVAR(Barrel): {IEDD_DUDS_BARREL};
    case QGVAR(Barrel_Grey): {IEDD_DUDS_BARREL};
    case QGVAR(Charge): {IEDD_DUDS_CHARGE};
    case QGVAR(Bucket): {IEDD_DUDS_BUCKET};
    case QEGVAR(vbied,box): {IEDD_DUDS_VBIED};
    default {[]};
};
if (_wires isNotEqualTo []) then {
    {
        if (!isNull _x) then  {
            _x attachTo [_bombObj,(_wires #_forEachIndex) #0];
            _x setVectorDirAndUp ((_wires #_forEachIndex) #1);
        };
    } forEach _ieddWires;
} else {
    TRACE_1("No defined dud positions to wires.",_bombObj);
};
