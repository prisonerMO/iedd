#include "script_component.hpp"
params ["_control", "_curSel"];

if (_curSel < 0) exitwith {};
private _display = ctrlParent _control;
private _typeCtrl = _display displayCtrl 52520;
private _typeNum = lbCurSel _typeCtrl;
private _type = _typeCtrl lbData _typeNum;
private _varCtrl = _display displayCtrl 52521;
lbClear	_varCtrl;

private _data = "true" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values");
{
    private _name = getText (_x >> "name");
    private _value = getNumber (_x >> "value");
    _varCtrl lbAdd _name;
    _varCtrl lbSetValue [_forEachIndex, _value];
} forEach _data;