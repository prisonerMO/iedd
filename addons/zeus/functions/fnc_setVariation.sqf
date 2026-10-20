#include "\x\iedd\addons\ied\functions\script_component.hpp"
#define SETTEXTURE(color) format [QPATHTOEF(models,textures\IED_Wire%1_co.paa),color]
/*
 * Author: Prisoner
 * Change variation of IED
 *
 * Arguments:
 * 1: Object <OBJECT>
 * 2: Type <STRING>
 * 3: Variation <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [IED, "iedd_ied_FuelCanister", 1] call iedd_zeus_fnc_setVariation
 *
 * Public: Yes
 */

params ["_obj","_type","_variation"];
TRACE_1("IED SetVariation:",_this);
diag_log format ["Varation: %1", _this];
private _ieddWires = _obj getVariable [QEGVAR(ied,wires),[]];
if (count _ieddWires != 7) exitWith {TRACE_1("already started defuse.",_obj);};
private _vars = switch (_type) do {
    case QEGVAR(ied,CanisterFuel): {IEDD_JERRYVARS select 0 select 0};
    case QEGVAR(ied,CanisterPlastic): {IEDD_CANVARS  select 0 select 0};
    case QEGVAR(ied,Cardboard): {IEDD_CDVARS select 0 select 0};
    case QEGVAR(ied,Cinder): {IEDD_CINDERVARS select 0 select 0};
    case QEGVAR(ied,Metal): {IEDD_METALVARS select 0 select 0};
    case QEGVAR(ied,Metal_English): {IEDD_METALVARS select 0 select 0};
    case QEGVAR(ied,Barrel): {IEDD_BARRELVARS select 0 select 0};
    case QEGVAR(ied,Barrel_Grey): {IEDD_BARRELVARS select 0 select 0};
    case QEGVAR(ied,Charge): {IEDD_CHARGE select 0 select 0};
    case QEGVAR(ied,Bucket): {IEDD_BUCKET select 0 select 0};
    default {[]};
};
if (_vars isNotEqualTo []) then {
    diag_log format ["VARS: %1", _vars];
    {
        _x setObjectTexture ["Component01", SETTEXTURE(_vars select _forEachIndex)];
    } forEach _ieddWires;
    _obj setVariable [QEGVAR(ied,variation),_variation]
} else {
    TRACE_1("No defined positions to wires.",_bombObj);
};
