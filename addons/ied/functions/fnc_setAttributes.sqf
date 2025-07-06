#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Set ace surrender and ishandcuffed attributes on unit
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Value <BOOL>
 * 2: Ace type <STRING>
 * 3: Type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [unit, true, "ace_isSurrendered", "iedd_ied_isSurrendered"] call iedd_ied_fnc_setAttributes
 *
 * Public: No
 */

params ["_unit","_value","_aceType","_type"];
TRACE_1("fnc_setAttributes",_this);

if (isServer && {is3DEN}) then {
    private _isChargeVest = (_unit get3DENAttribute QGVAR(isCharge)) select 0;
    if (_isChargeVest) then {
        private _aceStatus = (_unit get3DENAttribute _aceType) select 0;
        if (_value && {!_aceStatus}) then {
            _unit set3DENAttribute [_aceType, _value];
        };
        if (!_value && {_aceStatus}) then{
            _unit set3DENAttribute [_aceType, _value];
        };
    } else {
        _unit set3DENAttribute [_type, false];
    };
};
