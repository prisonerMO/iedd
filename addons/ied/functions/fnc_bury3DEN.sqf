#include "script_component.hpp"
/*
 * Author: Prisoner
 * Bury IED
 *
 *
 * Arguments:
 * 0: IED Object <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [_ied] call iedd_ied_fnc_bury3DEN;
 *
 * Public: No
 */
 params [
    ["_obj",objNull],
    ["_value",false]
];
TRACE_1("iedd_ied_fnc_bury3DEN",_this);
if (_value) then {
    private _buryValue = _obj get3DENAttribute "iedd_ied_bury" select 0;
    if (_buryValue > 0) then {
        [_obj, _buryValue] call FUNC(buryIED3DEN);
    };
} else {    
    private _pos = getPosATL _obj;
    _pos set [2,0];
    _obj set3DENAttribute ["position", _pos];
};


