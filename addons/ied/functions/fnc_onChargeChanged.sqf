#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handle charge checkbox changed event
 *
 * Arguments:
 * 0: Checkbox control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_ctrlCheckBox] iedd_ied_fnc_onChargeChanged
 *
 * Public: No
 */

params ["_ctrlCheckbox"];
TRACE_1("fnc_onChargeChanged",_this);

private _state = cbChecked _ctrlCheckbox;
private _fade = [0.75,0] select _state;
private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;
private _all = (allControls (ctrlParent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);
{
        if (ctrlParentControlsGroup _x == _ctrlGroup) then {
            _x ctrlEnable _state;
            _x ctrlSetFade _fade;
            _x ctrlCommit 0;
        };
} forEach _all;

if (_state) then {
    private _isSuicide = _all select {ctrlClassName _x == "iedd_ied_isSuicide"};
    private _isSuicideGrp = allControls (_isSuicide select 0);
    private _isSuicideCtrl = _isSuicideGrp select 1;
    private _isState =  cbChecked _isSuicideCtrl;
    private _controls = _all select {"iedd_ied" in ctrlClassName _x};
    {
        private _ctrlclassname = ctrlClassName _x;
        if ("dist" in _ctrlclassname) then {
            _x ctrlEnable _isState;
            _x ctrlSetFade ([0.75,0] select _isState);
            _x ctrlCommit 0;
        } else {
            _x ctrlEnable !_isState;
            _x ctrlSetFade ([0.75,0] select !_isState);
            _x ctrlCommit 0;
        };
    } forEach _controls - _isSuicide;
};