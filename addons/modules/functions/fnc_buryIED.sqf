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
};

if !(typeOf _unit in IEDD_CLASSES + IEDD_FAKE_CLASSES) exitWith {
    _message = "Type of unit is not IED";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

if (_unit getVariable [QEGVAR(ied,isBury), false]) exitWith {
    _message = "IED is already buried";
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

//TO-DO: If buried then make it unburied and reset the position to the original position/ make it modify bury depth and orientation. 

[QEGVAR(ied,hideObject), [_unit, true], ACE_player] call CBA_fnc_targetEvent;

private _dir        = getDir _unit;
private _vectorDir  = vectorDir _unit;
private _vectorUp   = vectorUp _unit;
private _unitPos    = getPosATL _unit;
private _type       = getModelInfo _unit select 1;
private _yaw        = [getDir _unit] call CBA_fnc_simplifyAngle180;
(_unit call BIS_fnc_getPitchBank) params ["_pitch", "_roll"];

private _configDepth = getArray (configOf _unit >> "iedd_ied_buryDepth"); // [x,y,z]

private _dummy = createSimpleObject [_type, _unitPos];
_dummy setDir _dir;
_dummy setVectorDirAndUp [_vectorDir, _vectorUp];
_dummy setPosATL _unitPos;
private _xv = abs (_vectorUp # 0);
private _yv = abs (_vectorUp # 1);
private _zv = abs (_vectorUp # 2);
private _max = selectMax [_xv, _yv, _zv];
private _vector = switch (_max) do {
    case _xv: { _configDepth select 0 };
    case _yv: { _configDepth select 1 };
    case _zv: { _configDepth select 2 };
};
private _start = _vector / 2;
private _helper = "iedd_ied_helper" createVehicleLocal _unitPos;
_helper setPosATL _unitPos;
_helper setVectorUp (surfaceNormal getPosASL _helper);
private _ref = "iedd_ied_helper" createVehicleLocal (getPosASL _helper);
_ref setPosASL (getPosASL _helper);
_ref setVectorDirAndUp [_vectorDir, _vectorUp];
private _relDirUp = [_ref, _helper] call BIS_fnc_vectorDirAndUpRelative;
deleteVehicle _ref;

private _depthStart = 0;
private _endStart = _start - (_vector * 0.01);

_dummy attachTo [_helper, [0, 0, _endStart]];
_dummy setVectorDirAndUp _relDirUp;


private _rollValues = [_pitch, _roll, _yaw];
private _buryValues = [_vector, _start,_depthStart, _endStart, _configDepth];
_display setVariable [QGVAR(roll), _rollValues];
_display setVariable [QGVAR(bury), _buryValues];
_display setVariable [QGVAR(dummy), _dummy];
_display setVariable [QGVAR(helper), _helper];

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
    private _dummy = _display getVariable [QGVAR(dummy), objNull];
    if(isNull _dummy) exitWith {};

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


    // dir/up composed from pitch/roll/yaw, applied relative to the helper
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
    _dummy setVectorDirAndUp [_dv, _uv];
    _display setVariable [QGVAR(roll), [_pitch, _roll, _yaw]];    
     diag_log format ["IEDD module _dummy: %1, _pos: %2, _modelToWorld: %3", _dummy, getPosATL _dummy,  _dummy modelToWorld[0,0,0]];
};

private _fnc_sliderBury = {
    params ["_slider"];
    private _display = ctrlParent _slider;
    if (isNull _display) exitWith {};
    private _dummy = _display getVariable [QGVAR(dummy), objNull];
    private _helper = _display getVariable [QGVAR(helper), objNull];
    if (isNull _dummy || isNull _helper) exitWith {};
    private _values = _display getVariable [QGVAR(bury), []];
    if (_values isEqualTo []) exitWith {};
    _values params ["_vector", "_start", "_depth", "_end", "_configDepth"];

    _sliderDepth = sliderPosition _slider;
    _slider ctrlSetTooltip format [" %1 %2", round (_sliderDepth), "Step"];
    private _textCtrl = _display displayCtrl 72527;
    _textCtrl ctrlSetText format [" %1 %2", round (_sliderDepth), "Step"];
    private _depth = _sliderDepth;
    private _vectorUp = vectorUp _dummy;
    private _xv = abs (_vectorUp # 0);
    private _yv = abs (_vectorUp # 1);
    private _zv = abs (_vectorUp # 2);
    private _max = selectMax [_xv, _yv, _zv];
    private _vector = switch (_max) do {
        case _xv: { _configDepth select 0 };
        case _yv: { _configDepth select 1 };
        case _zv: { _configDepth select 2 };
    };
    private _end = _start - (_vector * (_depth / 20));
    _dummy attachTo [_helper, [0, 0, _end]]; 

    _display setVariable [QGVAR(bury), [_vector, _start, _depth, _end, _configDepth]];
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
_sliderBury sliderSetPosition _depthStart;
private _sliderDepth = sliderPosition _sliderBury;
_sliderBury ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderBury];
_buryEdit ctrlSetText format [" %1 %2", _sliderDepth, "Step"];
_buryEdit setVariable [QGVAR(values), [_sliderBury, _fnc_sliderBury]];
_buryEdit ctrlAddEventHandler ["KeyUp", _fnc_editControl];

private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target", objNull];
    private _unit = attachedTo _logic;
    if (isNull _unit) exitWith {};
    private _display = _this select 0;
    private _dummy = _display getVariable [QGVAR(dummy), objNull];
    private _helper = _display getVariable [QGVAR(helper), objNull];
    if !(isNull _dummy) then { deleteVehicle _dummy };
    if !(isNull _helper) then { 
        if (attachedObjects _helper select 0 != _unit) then {
            deleteVehicle _helper;
        };
    };
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
    [QEGVAR(ied,hideObject), [_unit, false], ACE_player] call CBA_fnc_targetEvent;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
    diag_log format ["%1: %2", _ctrlButtonOK, _this];
	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    if (isNull _logic) exitWith {systemChat "Logic is null";};
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {systemChat "Display is null";};
    private _unit = attachedTo _logic;
    if (isNull _unit) exitWith {systemChat "Unit is null";};
    private _values = _display getVariable [QGVAR(bury), []];
    if (_values isEqualTo []) exitWith {deleteVehicle _logic; systemChat "No values found";};
    _values params ["_vector", "_start", "_depth", "_end", "_configDepth"];
    systemChat format ["Burying IED with _vector: %1, _start: %2, _depth: %3, _end: %4, _configDepth: %5", _vector, _start, _depth, _end, _configDepth];
    private _dummy = _display getVariable [QGVAR(dummy), objNull];
    private _helper = _display getVariable [QGVAR(helper), objNull];
    if (isNull _helper) exitWith {systemChat "Helper is null";};
    if (isNull _dummy) exitWith {systemChat "Dummy is null";};
    private _vectorUp = vectorUp _dummy;
    private _vectorDir = vectorDir _dummy;
    deleteVehicle _dummy;    
    _unit attachTo [_helper, [0,0, _end]];    
    _unit setVectorDirAndUp [_vectorDir, _vectorUp];
    _unit setVariable [QEGVAR(ied,isBury),true, true];
};

private _fnc_onCancel = {
    params [["_ctrlButtonCancel", controlNull, [controlNull]]];
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    if (isNull _logic) exitWith {};
    private _display = ctrlParent _ctrlButtonCancel;
    if (isNull _display) exitWith {};
    private _helper = _display getVariable [QGVAR(helper), objNull];
    if (!isNull _helper) then {deleteVehicle _helper;};
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
_ctrlButtonCancel ctrlAddEventHandler ["ButtonClick", _fnc_onCancel];
