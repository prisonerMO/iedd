#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Initalizes the "Set VBIED" Zeus module display.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Control] call iedd_modules_fnc_setVbied
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_setVbied",_this);

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "SetFocus";
private _vehicle = attachedTo _logic;
private _message = "No Vehicle selected";
TRACE_1("Vehicle",_vehicle);

if (isNull _vehicle) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
private _allVehicles = entities [["LandVehicle","Air","Ship"], []];
if !(_vehicle in _allVehicles) exitWith { //Check vehicle , how
	_message = "Type of unit is not vehicle";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
if (!alive _vehicle) exitWith {
	_message = "Vehicle is not alive";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
private _attachedObjects = attachedObjects _vehicle;
private _index = _attachedObjects findIf {typeOf _x == QEGVAR(vbied,box)};
if (_index > -1) exitWith {
	_message = "Vehicle have VBIED attached already";
	deleteVehicle _logic;
	[ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 2;
};
private _model = getModelInfo _vehicle select 0;
private _index = VBIED_MODELS findIf {_model in _x};
private _type = typeOf _vehicle;
EGVAR(vbied,preDefined) set ["model",[_index,_model,_type]];
/*TODO - Check if vehicle have not predefined positions*/
[{
    params ["_display","_logic"];
    private _posCtrl = _display displayCtrl 52520;
    private _sel = lbCurSel _posCtrl;
    private _value = _posCtrl lbValue _sel;
    private _data = [_posCtrl,_value] call FUNC(setData);
    TRACE_1("Data",_data);
    if (_data isEqualTo []) exitWith {
        private _message = "No predefined positions for this vehicle";
        deleteVehicle _logic;
        [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
        _display closeDisplay 2;
    };
}, [_display,_logic]] call CBA_fnc_execNextFrame;

//Specific dud :
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


//Specific distance:
private _fnc_sliderDistMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52529]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
};


private _sliderDist = _display displayCtrl 52524;
_sliderDist sliderSetSpeed [1,1];
_sliderDist sliderSetPosition 0;
_sliderDist ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderDistMove];
_sliderDist call _fnc_sliderDistMove;

//Specific speed:
private _fnc_sliderSpeed = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52528]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"km/h"];
};

private _sliderSpeed = _display displayCtrl 52528;
_sliderSpeed sliderSetSpeed [1,1];
_sliderSpeed sliderSetPosition iedd_vbied_defaultSpeed;
private _model = iedd_vbied_preDefined get 'model';
private _type = _model select 2;
private _max = (getNumber (configFile >> "CfgVehicles" >> _type >> "maxSpeed")) max 50;
_sliderSpeed sliderSetRange [1, _max];
_sliderSpeed ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderSpeed];
_sliderSpeed call _fnc_sliderSpeed;

//Specific on-load stuff:
private _fnc_sliderValueMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider; // IDCs ∈ [52530]
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
};

private _sliderValue = _display displayCtrl 52530;
//_slider sliderSetRange [0, 0.3];
_sliderValue sliderSetSpeed [1,1];
_sliderValue sliderSetPosition iedd_vbied_defaultTimerValue;
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
    private _vehicle = attachedTo _logic;
    private _posCtrl = _display displayCtrl 52520;
    private _sel = lbCurSel _posCtrl;
    private _value = _posCtrl lbValue _sel;
    private _data = [_posCtrl,_value] call FUNC(setData);
    TRACE_1("Data:",_data);
    private _varCtrl = _display displayCtrl 52521;
    private _variation = lbCurSel _varCtrl;
    if (_variation == 5) then {
        _variation = floor (random 5);
    };
    private _sizeCtrl = _display displayCtrl 52522;
    private _size = lbCurSel _sizeCtrl;
    private _dud = sliderPosition (_display displayCtrl 52523);;
    private _dist = round(sliderPosition (_display displayCtrl 52524));
    private _getInCtrl = _display displayCtrl 52525;
    private _getIn = lbCurSel _getInCtrl;
    private _engineOnCtrl = _display displayCtrl 52526;
    private _engineOn = lbCurSel _engineOnCtrl;
    private _moveCtrl = _display displayCtrl 52527;
    private _move = lbCurSel _moveCtrl;
    private _speed = round(sliderPosition (_display displayCtrl 52528));
    private _timerCtrl = _display displayCtrl 52529;
    private _timerValue = lbCurSel _timerCtrl;
    private _timerTime = round(sliderPosition (_display displayCtrl 52530));
    private _isRandom = false;
    [QGVAR(createVbied), [_vehicle,_data,_variation,_dud,_size,_timerValue,_timerTime,_isRandom,_dist,_getIn,_engineOn,_move,_speed]] call CBA_fnc_serverEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
