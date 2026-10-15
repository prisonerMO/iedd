#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Change the notebook tabs
 *
 * Arguments:
 * 0: Variation <STRING> (default: "home")
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
systemChat format ["%1: %2", _var, _current];
disableSerialization;
private _sound = format [QPATHTOF(sounds\side%1.ogg), floor (random 3)];
playSoundUI [_sound, 0.6,1];
private _display = uiNamespace getVariable "iedd_display";
private _ctrl = _display displayCtrl NOTEBOOK_IDC_BACK;
private _arrowL = _display displayCtrl NOTEBOOK_IDC_PREV;
private _arrowR = _display displayCtrl NOTEBOOK_IDC_NEXT;
private _max = GVAR(pages) get _var;

private _showR = _current == _max;
_arrowR ctrlShow !_showR;
private _showL = _current == 0;
_arrowL ctrlShow !_showL;

GVAR(pages) set ["page", _current];
GVAR(pages) set ["iedd_tab", _var];
CTRL_SET_TEXT(_ctrl,_var,_current);

