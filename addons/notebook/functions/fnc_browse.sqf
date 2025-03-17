#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Browse through the notebook pages
 *
 * Arguments:
 * 0: Number <NUMBER>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [1] call iedd_notebook_fnc_browse
 *
 * Public: No
 */

params ["_selectDir"];
TRACE_1("fnc_browse",_this);

disableSerialization;

private _sound = format [QPATHTOF(sounds\page%1.ogg), floor (random 4)];
playSoundUI [_sound, 0.6,1];

private _display = uiNamespace getVariable "iedd_display";
private _ctrl = _display displayCtrl NOTEBOOK_IDC_BACK;
private _arrowL = _display displayCtrl NOTEBOOK_IDC_PREV;
private _arrowR = _display displayCtrl NOTEBOOK_IDC_NEXT;
private _var = GVAR(pages) getOrDefault ["iedd_tab", "home", true];
private _page = GVAR(pages) getOrDefault [_var, 0, true];
private _current = _page+_selectDir;

if (fileExists format[QPATHTOF(images\%1\%2%3.paa), _var, _var, _current]) then {
    _ctrl ctrlSetText format [QPATHTOF(images\%1\%2%3.paa), _var, _var, _current];
} else {
    _current = _current-_selectDir;
};

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
_ctrl ctrlSetText format [QPATHTOF(images\%1\%2%3.paa), _var, _var, _current];
