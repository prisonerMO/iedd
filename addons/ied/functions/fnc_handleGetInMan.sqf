#include "script_component.hpp"
params ["_unit", "_role", "_vehicle", "_turret"];
diag_log format ["GetInMan Called %1",_this];
// ensure event is only called once
[{
    params ["_args", "_idPFH"];
    _args params ["_unit","_vehicle"];
    _unit setVariable [QGVAR(getInManPH),_idPFH];
    if (speed _vehicle > 45) then {        
        diag_log format ["is speed unit %1, %2",speed _vehicle,_unit];
        _unit setDamage 1;
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_unit,_vehicle]] call CBA_fnc_addPerFrameHandler;

_unit addEventHandler ["GetOutMan", {
    params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
    diag_log format ["GETOUT: %1", _this];
    private _idPFH = _unit getVariable [QGVAR(getInManPH),-1];
    if (_idPFH != -1) then {
        [_idPFH] call CBA_fnc_removePerFrameHandler;
        diag_log format ["isEjected unit removed %1, %2",_unit,_idPFH];
    };
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
                    [QGVAR(hideObject),[_part,false]] call CBA_fnc_globalEventJIP;
                } forEach _attachedParts;
            };
            [QGVAR(hideObject),[_charge,false]] call CBA_fnc_globalEventJIP;
        } forEach _charges;
    };       
    _unit removeEventHandler [_thisEvent, _thisEventHandler];
}];

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
                [QGVAR(hideObject),[_part,true]] call CBA_fnc_globalEventJIP;
            } forEach _attachedParts;
        };
        [QGVAR(hideObject),[_charge,true]] call CBA_fnc_globalEventJIP;
    } forEach _charges;
};