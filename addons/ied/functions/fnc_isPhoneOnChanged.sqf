#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Checkesbox control state on change
 *
 *
 * Arguments:
 * 0: control - Checkbox control
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [ctrlCheckbox] call iedd_ied_fnc_isPhoneOnChanged;
 *
 * Public: No
 */

params ["_ctrlCheckbox"];
TRACE_1("fnc_onBuryChanged",_this);
private _state = cbChecked _ctrlCheckbox;
private _fade = [0.75,0] select _state;
private _all = allControls (ctrlParent _ctrlCheckbox);
private _controls = (_all select {ctrlClassName _x find ["iedd_ied_phone", 0] == 0});
{
    private _control = _x;
    _control ctrlEnable _state;
    _control ctrlSetFade _fade;
    _control ctrlCommit 0;
} forEach _controls;
