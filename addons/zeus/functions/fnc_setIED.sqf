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
    private _ctrlButtonCancel = _display displayCtrl 2;
    _control ctrlRemoveAllEventHandlers "SetFocus";
    private _unit = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
    //Load variables from server
    [QGVAR(getData),[_unit, ace_player], ace_player] call CBA_fnc_targetEvent;    
    diag_log format ["Unit: %1 Player: %2 Data: %3",_unit, ace_player, GVAR(data)];
    //Set controls to current values
    private _type = typeOf _unit;
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        private _colors = ["g","b","r","w"];
        private _texture = getObjectTextures _unit select 0;
        private _names = [LELSTRING(ied,FuelCanister_Green),LELSTRING(ied,FuelCanister_Blue),LELSTRING(ied,FuelCanister_Red),LELSTRING(ied,FuelCanister_White)];
        private _displayName = LELSTRING(ied,FuelCanister_Green);
        {
            if (_texture find [_x,58] == 58) exitWith {                
                _displayName = _names select _forEachIndex;
                private _colorCombo = _display displayCtrl 52534;
                _colorCombo lbSetCurSel _forEachIndex;                  
            };
        } forEach _colors;
        private _typeCtrl = _display displayCtrl 52520;
        _typeCtrl ctrlSetText _displayName;
        _typeCtrl ctrlCommit 0;
        GVAR(data) set ["color",_texture];
    };

    private _variationCtrl = _display displayCtrl 52521;
    private _variation = GVAR(data) get "variation";
    _variationCtrl lbSetCurSel _variation;
    _variationCtrl ctrlCommit 1;

    private _sizeCtrl = _display displayCtrl 52522;
    private _size = GVAR(data) get "size";
    _sizeCtrl lbSetCurSel _size;
    _sizeCtrl ctrlCommit 1;

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
    private _sliderTimerValue = _display displayCtrl 52526;
    private _timer = GVAR(data) get "timerValue";
    _sliderTimerValue sliderSetSpeed [1,1];
    _sliderTimerValue sliderSetPosition _timerValue;
    _sliderTimerValue ctrlAddEventHandler ["SliderPosChanged", _fnc_sliderValueMove];
    _sliderTimerValue call _fnc_sliderValueMove;

    if (_type == QEGVAR(ied,Bucket)) then {
        private _lidStateCtrl = _display displayCtrl 52528;
        private _lidState = GVAR(data) get "lidState";
        private _lidStateValue = [0,1] select _lidState;
        _lidStateCtrl lbSetCurSel _lidStateValue;

        private _sliderOce = _display displayCtrl 52530;
        private _openCloseEOD = GVAR(data) get "openCloseEOD";
        [_sliderOce, _openCloseEOD] call FUNC(sliderMove);

        private _sliderOc = _display displayCtrl 52532;
        private _openClose = GVAR(data) get "openCloseEOD";
        [_sliderOc, _openClose] call FUNC(sliderMove);
    };
    
    private _fnc_onConfirm = {
        params [["_ctrlButtonOK", controlNull, [controlNull]]];
        private _obj = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
        private _display = ctrlParent _ctrlButtonOK;
        if (isNull _display) exitWith {};
        if (isNull _obj) exitWith {};
        private _type = typeOf _obj ;
        private _variation = lbCurSel (_display displayCtrl 52521);
        private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configOf _obj >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
        private _random = _varData select 0;
        if (_variation == _random) then {
            _variation = floor (random _random);
        };
        private _clientData = [];
        private _size = lbCurSel (_display displayCtrl 52522);
        private _dud = sliderPosition (_display displayCtrl 52523);
        private _dist = round(sliderPosition (_display displayCtrl 52524));        
        private _timer = [false,true] select lbCurSel (_display displayCtrl 52525);
        _obj setVariable [QEGVAR(ied,timer),_timer,true];
        private _timerValue = round(sliderPosition (_display displayCtrl 52526));
        if (_type == QEGVAR(ied,CanisterFuel)) then {
            private _colorCtrl =  _display displayCtrl 52534;     
            private _color = _colorCtrl lbData (lbCurSel _colorCtrl);
            private _texture = GVAR(data) get "color";
            if (_texture != _color) then {
                _obj setObjectTextureGlobal ["camo", _color];
            };
        }; 
        if (_type == QEGVAR(ied,Bucket)) then {
            private _lidState = lbCurSel (_display displayCtrl 52528);
            private _openCloseEOD = sliderPosition (_display displayCtrl 52530);    
            private _openClose = sliderPosition (_display displayCtrl 52532);
            _obj animate ["bucketlid_hide", _lidState];
            _obj setVariable [QGVAR(lid), [_openClose,_openCloseEOD], true];
        };
        [QGVAR(setIEDServer), [_obj,_type,_size,_dud,_dist,_timerValue]] call CBA_fnc_serverEvent;
    };

    private _fnc_onUnload = {
        call FUNC(setData);   
    };

    _ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
    _display displayAddEventHandler ["Unload", _fnc_onUnload];

},[_control]] call CBA_fnc_execNextFrame;
