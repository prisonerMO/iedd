#include "..\script_component.hpp"
params ["_control"];
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1;
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
_control ctrlRemoveAllEventHandlers "SetFocus";
//Specific on-load stuff:
private _sliderDud = _display displayCtrl 52523;
_sliderDud call FUNC(sliderMove);

private _fnc_sliderDistMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider;
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
};
private _sliderDist = _display displayCtrl 52524;
_sliderDist sliderSetSpeed [1,1];
_sliderDist sliderSetPosition 0;
_sliderDist ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderDistMove];
_sliderDist call _fnc_sliderDistMove;

private _fnc_sliderValueMove = {
    params ["_slider"];
    private _idc = ctrlIDC _slider;
    _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
};
private _sliderValue = _display displayCtrl 52526;
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
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _typeCtrl = _display displayCtrl 52520;
    private _typeNum = lbCurSel _typeCtrl;
    private _type = _typeCtrl lbData _typeNum;
    private _varCtrl = _display displayCtrl 52521;
    private _variation = lbCurSel _varCtrl;
    private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
    private _random = _varData select 0;
    if (_variation == _random) then {
        _variation = floor (random _random);
    };
    private _sizeCtrl = _display displayCtrl 52522;
    private _size = lbCurSel _sizeCtrl;
    private _timerCtrl = _display displayCtrl 52525;
    private _timer = lbCurSel _timerCtrl;
    private _dud = sliderPosition (_display displayCtrl 52523);
    private _dist = round(sliderPosition (_display displayCtrl 52524));
    private _value = round(sliderPosition (_display displayCtrl 52526));
    private _lidStateCtrl = _display displayCtrl 52528;
    private _lidState = lbCurSel _lidStateCtrl;
    private _oce = sliderPosition (_display displayCtrl 52530);    
    private _oc = sliderPosition (_display displayCtrl 52532);
    [QGVAR(createIed), [_type,_pos,_variation,_dud,_size,_timer,_value,_dist,_typeNum,_lidState,_oce,_oc]] call CBA_fnc_serverEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
