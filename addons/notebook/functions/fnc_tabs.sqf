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

params [["_tab", "home"],["_page", 0]];
TRACE_1("fnc_tabs",_this);
disableSerialization;
private _sound = format [QPATHTOF(sounds\side%1.ogg), floor (random 3)];
playSoundUI [_sound, 0.6,1];
private _display = uiNamespace getVariable "iedd_display";
private _ctrl = _display displayCtrl NOTEBOOK_IDC_BACK;
private _arrowL = _display displayCtrl NOTEBOOK_IDC_PREV;
private _arrowR = _display displayCtrl NOTEBOOK_IDC_NEXT;
private _maxPages = GVAR(data) get _tab;

private _showR = _page == _maxPages;
_arrowR ctrlShow !_showR;
private _showL = _page == 0;
_arrowL ctrlShow !_showL;

GVAR(data) set ["iedd_page", _page];
GVAR(data) set ["iedd_tab", _tab];
CTRL_SET_TEXT(_ctrl,_tab,_page);

