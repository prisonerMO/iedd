#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles position on Control selection changed event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Current selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control,_lbCurSel] call iedd_vbied_fnc_pos_onLBSelChanged;
 *
 * Public: No
 */

params ["_ctrlCombo", "_lbCurSel"];
TRACE_1("fnc_pos_onLBSelChanged",_this);

private _ctrlGrp = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCombo;
private _all = allControls _ctrlGrp;
private _ctrls = _all select {ctrlClassName _x == "iedd_vbied_UserDefined"};
if (_ctrls isEqualTo []) exitWith {
    _this spawn {
        call FUNC(pos_onLBSelChanged);
    };
};
if (_lbCurSel == 0) exitWith {
    {
        for "_i" from 101 to 103 do {
            private _ctrl = _x;
            private _textCtrl = _ctrl controlsGroupCtrl _i;
            _textCtrl ctrlSetText format ["%1", _lbCurSel];
        };
    } forEach _ctrls;
};
_ctrls params ["_one","_two","_three"];
private _loc = _lbCurSel-1;
private _model = GVAR(preDefined) get "model";
private _index = _model select 0;
private _data = GVAR(preDefined) getOrDefault [_index,[]];
private _count = count _data;
if (_lbCurSel > _count) then {
    private _userModel = _model select 1;
    _data = GVAR(userDefined) get _userModel;
    _loc = _loc - _count;
};
private _s = _data get _loc;
{
    _x params ["_ctrl","_d"];
    private _kd = _s get _d;
    for "_i" from 101 to 103 do {
        private _text = _kd select _i-101;
        private _textCtrl = _ctrl controlsGroupCtrl _i;
        _textCtrl ctrlSetText format ["%1", _text];
    };
} forEach [[_one,"pos"],[_two,"dir"],[_three,"up"]];
