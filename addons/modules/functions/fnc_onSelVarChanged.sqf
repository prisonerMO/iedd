#include "script_component.hpp"
params ["_control", "_curSel"];
if (_curSel < 0) exitWith {};
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
private _grpCtrl = _display displayCtrl 52500;
private _state = _type == QEGVAR(ied,Bucket);
private _ocCtrls = allControls _grpCtrl select {"openClose" in (ctrlClassName _x)};
private _color = [[0, 0, 0, 0.5],[1,1,1,1]] select _state; //TO DO GET CORRECT COLORS!
private _bgcolor = [[0, 0, 0, 0.2],[0, 0, 0, 0.5]] select _state; 
{
    _x ctrlSetTextColor _color;
    _x ctrlSetBackgroundColor _bgcolor;
    _x ctrlEnable _state;

} forEach _ocCtrls;
/*
[_grpCtrl, _varCtrl, _state] spawn {
    params ["_grpCtrl", "_varCtrl", "_state"];
    private _pos = ctrlPosition _grpCtrl;
    diag_log format ["onhcnaged pos %1",_pos];
    diag_log format ["ctrlPosition _varCtrl  %1",ctrlPosition _varCtrl ];
    private _value = ctrlPosition _varCtrl select 1;
    _value = _value * ([7,9] select _state);
    _pos set [3, _value];
    diag_log format ["onhcnaged pos NEW %1",_pos];
    _grpCtrl ctrlSetPosition _pos;
    _grpCtrl ctrlCommit 0;
};
*/