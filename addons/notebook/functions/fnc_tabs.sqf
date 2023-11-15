#include "script_component.hpp"
params [["_var", "home"],["_current", 0]];
disableSerialization;
private _sound = format [QPATHTOF(sounds\side%1.ogg), floor (random 3)];
playSoundUI [_sound, 0.6,1];
private _display = uiNamespace getVariable "iedd_display";
private _ctrl = _display displayCtrl 120;
private _arrowL = _display displayCtrl 121;
private _arrowR = _display displayCtrl 122;

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

