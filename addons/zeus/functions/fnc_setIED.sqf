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
    GVAR(data) params ["_dist","_dud","_size","_timer","_timerValue","_variation","_lidState","_openClose","_openCloseEOD"];
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
    _vartionCtrl lbSetCurSel _variation;

    private _sizeCtrl = _display displayCtrl 52522;
    _sizeCtrl lbSetCurSel _size;

    private _sliderDud = _display displayCtrl 52523;  
    [_sliderDud, _dud] call FUNC(sliderMove);

    private _fnc_sliderDistMove = {
        params ["_slider"];
        private _idc = ctrlIDC _slider;
        _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"m"];
    };
    private _sliderDist = _display displayCtrl 52524;
    _sliderDist sliderSetSpeed [1,1];
    _sliderDist sliderSetPosition _dist;
    _sliderDist ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderDistMove];
    _sliderDist call _fnc_sliderDistMove;

    private _timerCtrl = _display displayCtrl 52525;
    private _timerValue = [0,1] select _timer;
    _timerCtrl lbSetCurSel _timerValue;

    private _fnc_sliderValueMove = {
        params ["_slider"];
        private _idc = ctrlIDC _slider;
        _slider ctrlSetTooltip format ["%1%2", round(sliderPosition _slider),"s"];
    };
    private _sliderTimerValue = _display displayCtrl 52526;
    _sliderTimerValue  sliderSetSpeed [1,1];
    _sliderTimerValue sliderSetPosition _timerValue;
    _sliderTimerValue ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
    _sliderTimerValue call _fnc_sliderValueMove;

    if (_type == QEGVAR(ied,Bucket)) then {
        private _lidStateCtrl = _display displayCtrl 52528;
        private _lidStateValue = [0,1] select _lidState;
        _lidStateCtrl lbSetCurSel _lidStateValue;

        private _sliderOce = _display displayCtrl 52530;
        [_sliderOce, _openCloseEOD] call FUNC(sliderMove);

        private _sliderOc = _display displayCtrl 52532;
        [_sliderOc, _openClose] call FUNC(sliderMove);
    };
    
    private _fnc_onConfirm = {
        params [["_ctrlButtonOK", controlNull, [controlNull]]];
        private _unit = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
        private _display = ctrlParent _ctrlButtonOK;
        if (isNull _display) exitWith {};
        if (isNull _unit) exitWith {};
        private _variation = lbCurSel (_display displayCtrl 52521);
        private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configOf _unit >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
        private _random = _varData select 0;
        if (_variation == _random) then {
            _variation = floor (random _random);
        };
        private _size = lbCurSel (_display displayCtrl 52522);
        private _timer = lbCurSel (_display displayCtrl 52525);
        private _dud = sliderPosition (_display displayCtrl 52523);
        private _dist = round(sliderPosition (_display displayCtrl 52524));
        private _timer = lbCurSel (_display displayCtrl 52525);
        private _timerValue = round(sliderPosition (_display displayCtrl 52526));
        private _lidState = lbCurSel (_display displayCtrl 52528);
        private _openCloseEOD = sliderPosition (_display displayCtrl 52530);    
        private _openClose = sliderPosition (_display displayCtrl 52532);
        [QGVAR(setIed), [_variation,_dud,_size,_timer,_timerValue,_dist,_lidState,_openCloseEOD,_openClose]] call CBA_fnc_serverEvent;
    };
    _ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];

},[_control]] call CBA_fnc_execNextFrame;
