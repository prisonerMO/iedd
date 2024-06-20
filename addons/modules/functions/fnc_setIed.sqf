#include "script_component.hpp"
params ["_control"];
//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "SetFocus";

//Specific on-load stuff:
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52523]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider * 100),"%"];
};


private _sliderDud = _display displayCtrl 52523;
_sliderDud sliderSetRange [0, 1];
_sliderDud sliderSetSpeed [0.01,0.1];
_sliderDud sliderSetPosition 0;
_sliderDud ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
_sliderDud call _fnc_sliderMove;


//Specific on-load stuff:
private _fnc_sliderDistMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52524]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
};


private _sliderDist = _display displayCtrl 52524;
//_slider sliderSetRange [0, 0.3];
_sliderDist sliderSetSpeed [1,1];
_sliderDist sliderSetPosition 0;
_sliderDist ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderDistMove];
_sliderDist call _fnc_sliderDistMove;

//Specific on-load stuff:
private _fnc_sliderValueMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52526]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
};

private _sliderValue = _display displayCtrl 52526;
//_slider sliderSetRange [0, 0.3];
_sliderValue sliderSetSpeed [1,1];
_sliderValue sliderSetPosition iedd_ied_defaultTimerValue;
_sliderValue ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
_sliderValue call _fnc_sliderValueMove;


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
    if (_variation > 5) then {
        _variation = floor (random 5);
    };
    private _sizeCtrl = _display displayCtrl 52522;
    private _size = lbCurSel _sizeCtrl;
    if (_size > 3) then {
        _size = selectRandom [0,1,2];
    };
    private _timerCtrl = _display displayCtrl 52525;
    private _timer = lbCurSel _timerCtrl;
    private _dud = sliderPosition (_display displayCtrl 52523);;
    private _dist = round(sliderPosition (_display displayCtrl 52524));
    private _value = round(sliderPosition (_display displayCtrl 52526));
    private _bombObj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];   
    _bombObj setVariable ["iedd_ied_variation",_variation,true];
    _bombObj setVariable ["iedd_ied_dud",_dud,true];
    _bombObj setVariable ["iedd_ied_size",_size,true];
    _bombObj setVariable ["iedd_ied_timer",_timer,true];
    _bombObj setVariable ["iedd_ied_timerValue",_value,true];
    _bombObj setVariable ["iedd_ied_fake",0,true]; //Override CBA settings default value
    _bombObj setVariable ["iedd_ied_decals",false,true]; //Override CBA settings default value
    _bombObj setVariable ["iedd_ied_distance",_dist,true]; //Override CBA settings default value if over 0
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        private _color = ["green", "Blue", "red", "White"] select _typeNum-1;
        _bombObj setVariable ["iedd_ied_color",_color,true];
    };

};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
