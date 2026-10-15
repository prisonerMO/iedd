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
private _tab = GVAR(pages) get "iedd_tab";
private _page = GVAR(pages) get "page";
private _max = GVAR(pages) get _tab;
private _current = _page+_selectDir;

private _showR = _current == _max;
_arrowR ctrlShow !_showR;
private _showL = _current == 0;
_arrowL ctrlShow !_showL;

GVAR(pages) set ["page", _current];
CTRL_SET_TEXT(_ctrl,_tab,_current);
