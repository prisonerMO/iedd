#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Change the notebook tabs
 *
 * Arguments:
 * 0: Varition <STRING> (default: "home")
 * 1: Current <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * ["info", 2] call iedd_notebook_fnc_tabs
 *
 * Public: No
 */

params [["_var", "home"],["_current", 0]];
TRACE_1("fnc_tabs",_this);

disableSerialization;
private _sound = format [QPATHTOF(sounds\side%1.ogg), floor (random 3)];
playSoundUI [_sound, 0.6,1];
private _display = uiNamespace getVariable "iedd_display";
private _ctrl = _display displayCtrl NOTEBOOK_IDC_BACK;
private _arrowL = _display displayCtrl NOTEBOOK_IDC_PREV;
private _arrowR = _display displayCtrl NOTEBOOK_IDC_NEXT;

if (_current == 0) then {
    _arrowL ctrlShow false;
} else {
    _arrowL ctrlShow true;
};
if !((fileExists format[QPATHTOF(images\%1\%2%3.paa), _var, _var, _current+1])) then {
    _arrowR ctrlShow false;
} else {
    _arrowR ctrlShow true;
};

GVAR(pages) set [_var, _current];
GVAR(pages) set ["iedd_tab", _var];
_ctrl ctrlSetText format [QPATHTOF(images\%1\%2%3.paa), _var, _var, _current];

