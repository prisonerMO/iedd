#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Set sides on attribute load
 *
 * Arguments:
 * 0: Control group <CONTROL>
 * 1: Value <ARRAY of NUMBERS> or <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlGroup, 1] call iedd_ied_fnc_sides_onAttributeLoad
 *
 * Public: No
 */

params ["_ctrlGroup", "_value"];
TRACE_1("fnc_sides_onAttributeLoad",_this);

private _states = [0,1,2,3];
if !(_value isEqualType []) then {
    _states set [_value,-1];
} else {
    _states = _value;
};
for '_i' from 100 to 103 do {
    if (_states param [_i - 100, -1] > -1) then {
        (_ctrlGroup controlsGroupCtrl _i) cbSetChecked true;
    };
};

