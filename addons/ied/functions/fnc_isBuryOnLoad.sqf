#include "..\script_component.hpp"
/*
 * Author: Prisoner 404
 * Bury IED
 *
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [ctrl] call iedd_ied_fnc_isBuryOnLoad;
 *
 * Public: No
 */

//params [];
params ["_ctrlCheckbox"];
//TRACE_1("fnc_isBuryOnLoad",_this);
_this spawn {
    params ["_ctrlCheckbox"];
    disableSerialization;
    sleep 0.1;
    private _state = cbChecked _ctrlCheckbox;
    private _fade = [0.75,0] select _state;
    private _all = allControls (ctrlParent _ctrlCheckbox);
    private _control = (_all select {ctrlClassName _x find ["iedd_ied_bury", 0] == 0}) select 0;
    _control ctrlEnable _state;
    _control ctrlSetFade _fade;
    _control ctrlCommit 0;
};


