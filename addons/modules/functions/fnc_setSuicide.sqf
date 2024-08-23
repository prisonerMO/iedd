#include "script_component.hpp"
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

private _slider = _display displayCtrl 62523;
_slider sliderSetRange [0, 1];
_slider sliderSetSpeed [0.01,0.1];
_slider sliderSetPosition 0;
_slider ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderMove];
_slider call _fnc_sliderMove;

//Specific on-load stuff:
private _fnc_sliderValueMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [62524,62525]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
};

private _sliderAct = _display displayCtrl 62524;
//_slider sliderSetRange [0, 0.3];
_sliderAct sliderSetSpeed [1,1];
_sliderAct sliderSetPosition 300; //CBA GET DEFAULT VALUE?
_sliderAct ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
_sliderAct call _fnc_sliderValueMove;

private _sliderExp = _display displayCtrl 62525;
//_slider sliderSetRange [0, 0.3];
_sliderExp sliderSetSpeed [1,1];
_sliderExp  sliderSetPosition 15; //CBA GET DEFAULT VALUE?
_sliderExp  ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
_sliderExp call _fnc_sliderValueMove;

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
    if (_variation > 4) then {
        _variation = floor (random 5);
    };
    private _sizeCtrl = _display displayCtrl 62522;
    private _size = lbCurSel _sizeCtrl;
    if (_size > 3) then {
        _size = selectRandom [0,1,2,3];
    };
    private _dud = sliderPosition (_display displayCtrl 62523);
    private _act = sliderPosition (_display displayCtrl 62524);
    private _exp = sliderPosition (_display displayCtrl 62525);
    private _dmsCtrl = _display displayCtrl 62526;
    private _isDms = [false,true] select lbCurSel _dmsCtrl;

    _unit setVariable ["iedd_ied_isSuicide",true,true];
    _unit setVariable ["iedd_ied_c_variation",_variation,true];
    _unit setVariable ["iedd_ied_c_dud",_dud,true];
    _unit setVariable ["iedd_ied_c_size",_size,true];
    _unit setVariable ["iedd_ied_actDist",_act,true];
    _unit setVariable ["iedd_ied_expDist",_exp,true];
    _unit setVariable ["iedd_ied_isDeadManSwitch",_isDms,true];
    TRACE_6("Module Suicide",_variation,_dud,_size,_act,_exp,_isDms);
    [QGVAR(addBombVest), [_unit,true]] call CBA_fnc_serverEvent;
    _unit setVariable ["iedd_ied_isCharge",true,true];
    [QGVAR(remove), [_unit], _unit] call CBA_fnc_targetEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
