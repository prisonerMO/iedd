#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Initialize Bury IED control
 *
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [ctrl] call iedd_ied_fnc_isPhoneOnLoad;
 *
 * Public: No
 */

//params [];
params ["_ctrlCheckbox"];
TRACE_1("fnc_isPhoneOnLoad",_this);
_this spawn {
    params ["_ctrlCheckbox"];
    disableSerialization;
    sleep 0.1;
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
};


