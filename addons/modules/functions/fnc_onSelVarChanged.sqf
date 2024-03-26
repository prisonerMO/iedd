#include "script_component.hpp"
params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};
private _display = ctrlParent _control;
private _typeCtrl = _display displayCtrl 52520;
private _typeNum = lbCurSel _typeCtrl;
private _type = _typeCtrl lbData _typeNum;

_variations = getNumber (configFile >> "CfgVehicles" >> typeOf _bombObj >> "iedd_ied_varCount");;

private _varCtrl = _display displayCtrl 52521;
lbClear	_varCtrl;
for "_i" from 0 to _variations-1 do {   
    _addList = "Variation "+ str (_i+1);
    _varCtrl lbAdd _addList;
    _varCtrl lbSetValue [_i, _i]; 
};
_addList = "Random";
_varCtrl lbAdd _addList;
_varCtrl lbSetValue [_variations, _variations];
GVAR(variations) = _variations;