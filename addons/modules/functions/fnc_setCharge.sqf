#include "script_component.hpp"
params ["_control"];
//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "setFocus";
private _unit = attachedTo _logic;
private _message = "No unit selected";

if (isNull _unit) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
if !(_unit isKindOf "CAManBase") exitWith {
	_message = "Type of unit is not infantry";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
if (!alive _unit) exitWith {    
	_message = "Unit is not alive";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};
if (_unit getVariable ["iedd_ied_isCharge",false]) exitWith {    
	_message = "Unit have IED vest already";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

//Specific on-load stuff:
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [62523]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider * 100),"%"];
};

{
    private _slider = _display displayCtrl _x;
    _slider sliderSetRange [0, 1];
    _slider sliderSetSpeed [0.01,0.1];
    _slider sliderSetPosition 0;
    _slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
    _slider call _fnc_sliderMove;
} forEach [62523];

private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    private _display = ctrlparent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _unit = attachedTo _logic;
    private _varCtrl = _display displayCtrl 62521;
    private _variation = lbCurSel _varCtrl;
    if (_variation > GVAR(variations)-1) then {
        _variation = floor (random GVAR(variations));
    };
    private _sizeCtrl = _display displayCtrl 62522;
    private _size = lbCurSel _sizeCtrl;
    if (_size > 2) then {
        _size = selectRandom [0,1,2];
    };
    private _timerCtrl = _display displayCtrl 62524;
    private _timer = lbCurSel _timerCtrl;
    private _posOfSlider = sliderPosition (_display displayCtrl 62523);
    private _dud = _posOfSlider;

    private _handCtrl = _display displayCtrl 62525;
    private _isHandcuffed = lbCurSel _handCtrl;
    private _surrenderCtrl = _display displayCtrl 62526;
    private _isSurrender = lbCurSel _surrenderCtrl;
    
    _unit setVariable ["iedd_ied_c_variation",_variation,true];
    _unit setVariable ["iedd_ied_c_dud",_dud,true];
    _unit setVariable ["iedd_ied_c_size",_size,true];
    _unit setVariable ["iedd_ied_c_timer",_timer,true]; // using CBA Defaults to timer countdown time
    [_unit,true] call EFUNC(ied,charge); 
    _unit setVariable ["iedd_ied_isCharge",true,true];

    diag_log [_variation,_dud,_size,_timer,_isHandcuffed,_isSurrender];
    //HERE HANDCUFFED/ SURRENDER see how it goes. 
    // something if (surrender) then {unit surrender}; <-- check that unit is not surrender already
    // if (_hand && !_surrender) then {unit handcuff}; <-- check that unit is not handcuffed already
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];
