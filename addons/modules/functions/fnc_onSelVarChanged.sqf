#include "script_component.hpp"
params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};
private _display = ctrlParent _control;
private _typeCtrl = _display displayCtrl 52520;
private _typeNum = lbCurSel _typeCtrl;
private _type = _typeCtrl lbData _typeNum;
private _varCtrl = _display displayCtrl 52521;
lbClear	_varCtrl;

for "_i" from 0 to 4 do {   
    _addList = "Variation "+ str (_i+1);
    _varCtrl lbAdd _addList;
    _varCtrl lbSetValue [_i, _i]; 
};
_addList = "Variation X";
_varCtrl lbAdd _addList;
_varCtrl lbSetValue [5, 5];

_addList = "Random";
_varCtrl lbAdd _addList;
_varCtrl lbSetValue [6, 6];

//GVAR(variations) = _variations;