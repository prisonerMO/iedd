#include "script_component.hpp"
params ["_control"];
//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "setFocus";

//Specific on-load stuff:
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52523]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider * 100),"%"];
};

{
    private _slider = _display displayCtrl _x;
    _slider sliderSetRange [0, 1];
    _slider sliderSetSpeed [0.01,0.1];
    _slider sliderSetPosition 0;
    _slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
    _slider call _fnc_sliderMove;
} forEach [52523];


private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
	private _pos = _logic modelToWorld [0,0,0];
    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _typeCtrl = _display displayCtrl 52520;
    private _typeNum = lbCurSel _typeCtrl;
    private _type = _typeCtrl lbData _typeNum;
    private _varCtrl = _display displayCtrl 52521;
    private _variation = lbCurSel _varCtrl;
    if (_variation > GVAR(variations)-1) then {
        _variation = floor (random GVAR(variations));
    };
    private _sizeCtrl = _display displayCtrl 52522;
    private _size = lbCurSel _sizeCtrl;
    if (_size > 3) then {
        _size = floor (random 3);
    };
    private _timerCtrl = _display displayCtrl 52524;
    private _timer = lbCurSel _timerCtrl;
    private _positionOfSlider = sliderPosition (_display displayCtrl 52523);
    private _dud = _positionOfSlider;    
    private _bombObj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];   
    _bombObj setVariable ["iedd_ied_variation",_variation,true];
    _bombObj setVariable ["iedd_ied_dud",_dud,true];
    _bombObj setVariable ["iedd_ied_size",_size,true];
    _bombObj setVariable ["iedd_ied_timer",_timer,true]; // // using CBA Defaults timer countdown time
    _bombObj setVariable ["iedd_ied_fake",0,true]; //Override CBA settings default value
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        private _color = ["green", "Blue", "red", "White"] select _typeNum-1;
        _bombObj setVariable ["iedd_ied_color",_color,true];
    };

};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
