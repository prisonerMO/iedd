#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Activate selected IED via ACE Zeus Actions
 *
 * Arguments:
 * 1: IED <OBJECT>
 * 2: Variation <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_zeus_fnc_setIEDServer
 *
 * Public: No
 */
params ["_obj","_type","_variation","_dud","_size","_timer","_value","_dist","_lidState","_oce","_oc","_color"];
TRACE_1("IED Data:",_this);
diag_log format ["KAMAA: %1",_this];
private _oldVar = _obj getVariable [QEGVAR(ied,variation),-1];
if (_variation != _oldVar) then {
     [QGVAR(setVariation),[_obj, _type, _variation]] call CBA_fnc_globalEvent;
};
_obj setVariable ["iedd_ied_dud",_dud];
_obj setVariable ["iedd_ied_size",_size];
_obj setVariable ["iedd_ied_timer",_timer];
_obj setVariable ["iedd_ied_timerValue",_value];
_obj setVariable ["iedd_ied_distance",_dist];
if (_type == QEGVAR(ied,Bucket)) then {
    _obj setVariable ["iedd_ied_lidState",_lidState];
    _obj setVariable ["iedd_ied_openCloseEOD",_oce];
    _obj setVariable ["iedd_ied_openClose",_oc];
};
if (_type == QEGVAR(ied,CanisterFuel)) then {
    private _texture = getObjectTextures _obj select 0;
    if (_texture != _color) then {
        _obj setObjectTextureGlobal ["camo", _color];
    };
};
