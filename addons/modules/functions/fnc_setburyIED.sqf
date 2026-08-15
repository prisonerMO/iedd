#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Initialize the "Place IED" Zeus module display.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Control] call iedd_modules_fnc_buryIED
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_buryIED",_this);
//TO-DO _this call iedd_modules_fnc_DisplayInit; --> To fix position of the display
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; // IDC_OK
private _ctrlButtonCancel = _display displayCtrl 2; // IDC_CANCEL
_control ctrlRemoveAllEventHandlers "SetFocus";

private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
if !(local _logic) exitWith {};

private _unit = attachedTo _logic;
private _message = "No unit selected";

if (isNull _unit) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 0;
};

if !(typeOf _unit in IEDD_CLASSES + IEDD_FAKE_CLASSES) exitWith {
    _message = "Type of unit is not IED";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 0;
};

if (_unit getVariable [QEGVAR(ied,isBury), false]) exitWith {
    _message = "IED is already buried";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 0;
};

if !(_unit call EFUNC(ied,canBuryIED)) exitWith {
    _message = "IED cannot be buried here";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
    _display closeDisplay 0;
    //create red "area" under the object to indicate that it cannot be buried here (on hover? HOW?)
};

//TO-DO: If buried then make it unburied and reset the position to the original position/ make it modify bury depth and orientation. 
private _dir = getDir _unit;
private _vectorDir = vectorDir _unit;
private _vectorUp = vectorUp _unit;
private _unitPos = getPosATL _unit;
_unitPos set [2, 0];
private _worldPos = _unit modelToWorld [0,0,0];
private _yaw = [getDir _unit] call CBA_fnc_simplifyAngle180;
(_unit call BIS_fnc_getPitchBank) params ["_pitch", "_roll"];
private _configDepth = getArray (configOf _unit >> "iedd_ied_buryDepth"); // [x,y,z]
private _vectorF = _vectorDir vectorCrossProduct _vectorUp;
_configDepth params ["_sizeX", "_sizeY", "_sizeZ"];
private _vector =
    (abs (_vectorF select 2)) * _sizeX +
    (abs (_vectorDir select 2)) * _sizeY +
    (abs (_vectorUp select 2)) * _sizeZ;
private _start = _vector / 2;
private _helper = createVehicle [QEGVAR(ied,helper), [0,0,0], [], 0, "CAN_COLLIDE"];
_helper setPosATL _unitPos;
_helper setVectorUp (surfaceNormal getPosASL _helper);
private _relDirUp = [_unit, _helper] call BIS_fnc_vectorDirAndUpRelative;
private _end = _start;
[QGVAR(attach),[_unit,_helper,_end],[_unit,_helper]] call CBA_fnc_targetEvent;
[QGVAR(rotate),[_unit,[_vectorDir,_vectorUp]],[_unit]] call CBA_fnc_targetEvent;
private _rollValues = [_pitch, _roll, _yaw];
private _buryValues = [0, _vector];
_display setVariable [QGVAR(roll), _rollValues];
_display setVariable [QGVAR(values), _buryValues];
_display setVariable [QGVAR(default), [_vectorDir, _vectorUp, _worldPos]];
_display setVariable [QGVAR(helper), _helper];
_display setVariable [QGVAR(unit), _unit];

private _sliderPitch = _display displayCtrl 72520;
private _sliderRoll  = _display displayCtrl 72522;
private _sliderYaw   = _display displayCtrl 72524;
private _sliderBury  = _display displayCtrl 72526;
private _pitchEdit = _display displayCtrl 72521;
private _rollEdit  = _display displayCtrl 72523;
private _yawEdit   = _display displayCtrl 72525;
private _buryEdit  = _display displayCtrl 72527;

private _fnc_sliderRotate = {
    params ["_slider"];
    private _display = ctrlParent _slider;
    if (isNull _display) exitWith {};
    private _unit = _display getVariable [QGVAR(unit), objNull];
    private _values = _display getVariable [QGVAR(roll), [0,0,0]];
    _values params ["_pitch", "_roll", "_yaw"];
    
    private _pos = sliderPosition _slider;
    private _idc = ctrlIDC _slider;
    switch (_idc) do {
        case 72520: { _pitch = _pos; };
        case 72522: { _roll  = _pos; };
        case 72524: { _yaw   = _pos; };
    };
    private _textCtrl = _display displayCtrl (_idc + 1);
    _textCtrl ctrlSetText format [" %1%2", round _pos, "°"];
    _slider ctrlSetTooltip format [" %1%2", round _pos, "°"];
    // dir/up composed from pitch/roll/yaw
    private _dv = [
        sin(_yaw) * cos(_pitch),
        cos(_yaw) * cos(_pitch),
        sin(_pitch)
    ];
    private _uv = [
        (-sin(_roll) * cos(_yaw)) - (cos(_roll) * sin(_pitch) * sin(_yaw)),
        ( sin(_roll) * sin(_yaw)) - (cos(_roll) * sin(_pitch) * cos(_yaw)),
        cos(_roll) * cos(_pitch)
    ];    
    private _helper = _display getVariable [QGVAR(helper), objNull];
    [QGVAR(rotate),[_unit,[_dv, _uv]],[_unit]] call CBA_fnc_targetEvent;
    _display setVariable [QGVAR(roll), [_pitch, _roll, _yaw]];
};

private _fnc_sliderBury = {
    params ["_slider"];
    private _display = ctrlParent _slider;
    private _values = _display getVariable [QGVAR(values), [0,0]];
    _values params ["_value", "_vector"];
    private _currentValue = round(sliderPosition _slider);
    if (_currentValue == _value) exitWith {};    
    private _helper = _display getVariable [QGVAR(helper), objNull];
    private _unit = _display getVariable [QGVAR(unit), objNull];
    _value = _currentValue;
    private _sliderText = if (_value < 2) then {
        format [" %1 %2", _value, "step"]
    } else {
        format [" %1 %2", _value, "steps"]
    };
    _slider ctrlSetTooltip _sliderText;
    private _textCtrl = _display displayCtrl 72527;
    _textCtrl ctrlSetText _sliderText;

    private _vectorUp = vectorUp _unit;
    private _vectorDir  = vectorDir _unit;
    private _vectorF = _vectorDir vectorCrossProduct _vectorUp;
    private _configDepth = getArray (configOf _unit >> "iedd_ied_buryDepth"); 
    _configDepth params ["_sizeX", "_sizeY", "_sizeZ"];
    private _vector =
        (abs (_vectorF select 2)) * _sizeX +
        (abs (_vectorDir select 2)) * _sizeY +
        (abs (_vectorUp select 2)) * _sizeZ;
    private _vectorEnd = _vector * (_value / 20);
    private _start = _vector/2;
    private _end = _start - _vectorEnd;
    [QGVAR(attach),[_unit,_helper,_end],[_unit,_helper]] call CBA_fnc_targetEvent;
    _display setVariable [QGVAR(values), [_value, _vector]];
};

{
    _x sliderSetSpeed [45,1];
    _x sliderSetRange [-180, 180];
    _x ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderRotate];
} forEach [_sliderPitch, _sliderRoll, _sliderYaw];

private _fnc_editControl = {
    params ["_ctrlEdit"];
    private _values = _ctrlEdit getVariable [QGVAR(values), []];
    if (_values isEqualTo []) exitWith {};
    _values params ["_ctrlSlider", "_fnc_slider"];
    private _value = parseNumber (ctrlText _ctrlEdit);
    _ctrlSlider sliderSetPosition _value;
    _value = sliderPosition _ctrlSlider;
    _ctrlSlider call _fnc_slider;
};

_sliderPitch sliderSetPosition _pitch;
_pitchEdit ctrlSetText format [" %1°", round _pitch];
_pitchEdit setVariable [QGVAR(values), [_sliderPitch, _fnc_sliderRotate]];
_pitchEdit ctrlAddEventHandler ["KeyUp", _fnc_editControl];

_sliderRoll sliderSetPosition _roll;
_rollEdit ctrlSetText format [" %1°", round _roll];
_rollEdit setVariable [QGVAR(values), [_sliderRoll, _fnc_sliderRotate]];
_rollEdit ctrlAddEventHandler ["KeyUp", _fnc_editControl];

_sliderYaw sliderSetPosition _yaw;
_yawEdit ctrlSetText format [" %1°", round _yaw];
_yawEdit setVariable [QGVAR(values), [_sliderYaw, _fnc_sliderRotate]];
_yawEdit ctrlAddEventHandler ["KeyUp", _fnc_editControl];

_sliderBury sliderSetSpeed [1,1];
_sliderBury sliderSetRange [0, 20];
_sliderBury sliderSetPosition 0;
private _sliderDepth = sliderPosition _sliderBury;
_sliderBury ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderBury];
private _sliderText = if (_sliderDepth < 2) then {
    format [" %1 %2", _sliderDepth, "step"]
} else {
    format [" %1 %2", _sliderDepth, "steps"]
};
_buryEdit ctrlSetText _sliderText;
_buryEdit setVariable [QGVAR(values), [_sliderBury, _fnc_sliderBury]];
_buryEdit ctrlAddEventHandler ["KeyUp", _fnc_editControl];

private _fnc_onUnload = {
    params ["_display", "_exitCode"];
    systemChat format ["Modules: Bury IED: Unload display with exit code %1", _exitCode];
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (!isNull _logic) then {
        deleteVehicle _logic;
    };
    if (_exitCode isEqualTo 2) then {
        private _unit = _display getVariable [QGVAR(unit), objNull];
        if !(isNull _unit) then {
            private _default = _display getVariable [QGVAR(default), []];
            _default params ["_vectorDir", "_vectorUp", "_worldPos"];
            detach _unit;
            _unit setPosWorld _worldPos;
            _unit setVectorDirAndUp [_vectorDir, _vectorUp];
        };
    };

    
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    if (!isNull _logic) then {
        deleteVehicle _logic;
    };
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _unit = _display getVariable [QGVAR(unit), objNull];
    if (isNull _unit) exitWith {};
    private _values = _display getVariable [QGVAR(values), [0,0]];
    _values params ["_value", "_vector"];
    private _helper = _display getVariable [QGVAR(helper), objNull];
    if (isNull _helper) exitWith {};
    if (_value < 1) exitWith {
        detach _unit;
        _unit setPosWorld (_unit modelToWorld [0,0,0]);    
    };
    private _vectorUp = vectorUp _unit;
    private _vectorDir = vectorDir _unit;
    private _unitPos = getPosATL _unit;
    _unitPos set [2, 0];
    _unit setVariable [QEGVAR(ied,isBury),true, true];
    _unit setVariable [QEGVAR(ied,bury),[_value, _vectorDir, _vectorUp, _vector,_unitPos], true];
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
