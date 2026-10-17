#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Intiliaze the "Place IED" Zeus module display.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [Control] call iedd_modules_fnc_setIed
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_setIed",_this);
_control call FUNC(setIEDOnLoad);
[{
    params ["_control"];
    private _display = ctrlParent _control;
    private _ctrlButtonOK = _display displayCtrl 1;
    _control ctrlRemoveAllEventHandlers "SetFocus";
    private _unit = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    //Load variables from server
    [QGVAR(getData),[_unit, ace_player], ace_player] call CBA_fnc_targetEvent;
    diag_log format ["Unit: %1 Player: %2 Data: %3",_unit, ace_player, GVAR(data)];
    
    //Set controls to current values
    private _type = typeOf _unit;
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        private _color = ["w","b","r"];
        private _texture = getObjectTextures _unit select 0;
        private _names = [LELSTRING(ied,FuelCanister_White),LELSTRING(ied,FuelCanister_Blue),LELSTRING(ied,FuelCanister_Red)];
        private _displayName = LELSTRING(ied,FuelCanister_Green);
        {
            if (_texture find [_x,58] == 58) exitWith {
                _displayName = _names select _forEachIndex;
            };
        } forEach _color;
        private _typeCtrl = _display displayCtrl 52520;
        _typeCtrl ctrlSetText _displayName;
        _typeCtrl ctrlCommit 0;
    };

    private _vartionCtrl = _display displayCtrl 52521;
    private _variation = GVAR(data) get "variation";
    _vartionCtrl lbSetCurSel _variation;

    private _sizeCtrl = _display displayCtrl 52522;
    private _size = GVAR(data) get "size";
    _sizeCtrl lbSetCurSel _size;

    private _sliderDud = _display displayCtrl 52523;  
    private _dud = GVAR(data) get "dud";  
    [_sliderDud, _dud] call FUNC(sliderMove);

    private _fnc_sliderDistMove = {
        params ["_slider"];
        private _idc = ctrlIDC _slider;
        _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
    };
    private _sliderDist = _display displayCtrl 52524;
    private _dist = GVAR(data) get "dist";
    _sliderDist sliderSetSpeed [1,1];
    _sliderDist sliderSetPosition _dist;
    _sliderDist ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderDistMove];
    _sliderDist call _fnc_sliderDistMove;

    private _timerCtrl = _display displayCtrl 52525;
    private _timer = GVAR(data) get "timer";
    private _timerValue = [0,1] select _timer;
    _timerCtrl lbSetCurSel _timerValue;

    private _fnc_sliderValueMove = {
        params ["_slider"];
        private _idc = ctrlIDC _slider;
        _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
    };
    private _sliderValue = _display displayCtrl 52526;
    _sliderValue sliderSetSpeed [1,1];
    private _timerValue = GVAR(data) get "timerValue";
    _sliderValue sliderSetPosition _timerValue;
    _sliderValue ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
    _sliderValue call _fnc_sliderValueMove;

    if (_type == QEGVAR(ied,Bucket)) then {
        private _lidStateCtrl = _display displayCtrl 52528;
        private _lidState = GVAR(data) get "lidState";
        private _lidStateValue = [0,1] select _lidState;
        _lidStateCtrl lbSetCurSel _lidStateValue;

        private _sliderOce = _display displayCtrl 52530;
        private _oce = GVAR(data) get "openCloseEOD";
        [_sliderOce, _oce] call FUNC(sliderMove);

        private _sliderOc = _display displayCtrl 52532;
        private _oc = GVAR(data) get "openClose";
        [_sliderOc, _oc] call FUNC(sliderMove);
    };
    // private _fnc_onUnload = {
    //     private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    //     if (isNull _logic) exitWith {};
    //     deleteVehicle _logic;
    // };

    // private _fnc_onConfirm = {
    //     params [["_ctrlButtonOK", controlNull, [controlNull]]];
    // 	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    // 	private _pos = _logic modelToWorld [0,0,0];
    //     private _display = ctrlParent _ctrlButtonOK;
    //     if (isNull _display) exitWith {};
    //     private _typeCtrl = _display displayCtrl 52520;
    //     private _typeNum = lbCurSel _typeCtrl;
    //     private _type = _typeCtrl lbData _typeNum;
    //     private _varCtrl = _display displayCtrl 52521;
    //     private _variation = lbCurSel _varCtrl;
    //     private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
    //     private _random = _varData select 0;
    //     if (_variation == _random) then {
    //         _variation = floor (random _random);
    //     };
    //     private _sizeCtrl = _display displayCtrl 52522;
    //     private _size = lbCurSel _sizeCtrl;
    //     private _timerCtrl = _display displayCtrl 52525;
    //     private _timer = lbCurSel _timerCtrl;
    //     private _dud = sliderPosition (_display displayCtrl 52523);
    //     private _dist = round(sliderPosition (_display displayCtrl 52524));
    //     private _value = round(sliderPosition (_display displayCtrl 52526));
    //     private _lidStateCtrl = _display displayCtrl 52528;
    //     private _lidState = lbCurSel _lidStateCtrl;
    //     private _oce = sliderPosition (_display displayCtrl 52530);    
    //     private _oc = sliderPosition (_display displayCtrl 52532);
    //     [QGVAR(createIed), [_type,_pos,_variation,_dud,_size,_timer,_value,_dist,_typeNum,_lidState,_oce,_oc]] call CBA_fnc_serverEvent;
    // };

    // _display displayAddEventHandler ["Unload", _fnc_onUnload];
    // _ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];

},[_control]] call CBA_fnc_execNextFrame;
