#include "..\script_component.hpp"
params ["_control"];
//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "SetFocus";
private _unit = attachedTo _logic;
private _message = "No unit selected";

if (isNull _unit) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
if !(_unit isKindOf "CAManBase") exitWith {
	_message = "Type of unit is not infantry";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
if (!alive _unit) exitWith {
	_message = "Unit is not alive";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
if (_unit getVariable ["iedd_ied_isCharge",false]) exitWith {
	_message = "Unit have IED vest already";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};

//Specific on-load stuff:
private _fnc_sliderMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [62523]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider * 100),"%"];
};

private _slider = _display displayCtrl 62523;
_slider sliderSetRange [0, 1];
_slider sliderSetSpeed [0.01,0.1];
_slider sliderSetPosition 0;
_slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
_slider call _fnc_sliderMove;

//Specific on-load stuff:
private _fnc_sliderValueMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [62526]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
};

private _sliderValue = _display displayCtrl 62525;
//_slider sliderSetRange [0, 0.3];
_sliderValue sliderSetSpeed [1,1];
_sliderValue sliderSetPosition iedd_ied_defaultTimerValue; //CBA GET DEFAULT VALUE?
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
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _unit = attachedTo _logic;
    private _varCtrl = _display displayCtrl 62521;
    private _variation = lbCurSel _varCtrl;
    if (_variation > 4) then {
        _variation = floor (random 5);
    };
    private _sizeCtrl = _display displayCtrl 62522;
    private _size = lbCurSel _sizeCtrl;
    if (_size > 3) then {
        _size = selectRandom [0,1,2,3];
    };
    private _dud = sliderPosition (_display displayCtrl 62523);
    private _timerCtrl = _display displayCtrl 62524;
    private _timer = lbCurSel _timerCtrl;
    private _value = sliderPosition (_display displayCtrl 62525);
    private _handCtrl = _display displayCtrl 62526;
    private _isHandcuffed = [false,true] select lbCurSel _handCtrl;
    private _surrenderCtrl = _display displayCtrl 62527;
    private _isSurrender = [false,true] select lbCurSel _surrenderCtrl;

    _unit setVariable ["iedd_ied_c_variation",_variation,true];
    _unit setVariable ["iedd_ied_c_dud",_dud,true];
    _unit setVariable ["iedd_ied_c_size",_size,true];
    _unit setVariable ["iedd_ied_c_timer",_timer,true];
    _unit setVariable ["iedd_ied_c_timerValue",_value,true];
    [QGVAR(addBombVest), [_unit,true]] call CBA_fnc_serverEvent;
    _unit setVariable ["iedd_ied_isCharge",true,true];

    TRACE_2("isHandcuffed or isSurrender",_isHandcuffed,_isSurrender);
    private _captive = (_unit getVariable ["ace_captives_isHandcuffed", false]);
    if (_isHandcuffed && !_captive) then {
         ["ace_captives_setHandcuffed", [_unit, !_captive], _unit] call CBA_fnc_targetEvent;
    };
    private _surrender = (_unit getVariable ["ace_captives_isSurrendered", false]);
    if (!_isHandcuffed && _isSurrender && !_surrender) then {
        ["ace_captives_setSurrendered", [_unit, !_surrender], _unit] call CBA_fnc_targetEvent;
    };
    [QGVAR(remove), [_unit], _unit] call CBA_fnc_targetEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
