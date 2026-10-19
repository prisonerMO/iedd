#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles the selection of the IED type and updates the variation list
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Current selection <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 0] call iedd_zeus_fnc_typeOnLoad;
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_setIEDOnLoad",_this);
private _display = ctrlParent _control;
private _typeCtrl = _display displayCtrl 52520;
private _unit = GETMVAR(BIS_fnc_initCuratorAttributes_target,objNull);
private _config = configOf _unit;
private _type = configName _config;
private _displayName = getText (_config >> "displayName");
_typeCtrl ctrlSetText _displayName;
_typeCtrl ctrlCommit 0;
private _varCtrl = _display displayCtrl 52521;
lbClear	_varCtrl;
private _data = "true" configClasses (_config >> "Attributes" >> "iedd_ied_variation" >> "Values");
{
    private _name = getText (_x >> "name");
    private _value = getNumber (_x >> "value");
    _varCtrl lbAdd _name;
    _varCtrl lbSetValue [_forEachIndex, _value];
} forEach _data;
_varCtrl ctrlCommit 0;
private _grpCtrl = _display displayCtrl 52500;
private _state = _type == QEGVAR(ied,Bucket);
private _bgCtrl = _display displayCtrl 30001;
private _titleCtrl = _display displayCtrl 30002;
private _contCtrl = _display displayCtrl 30003;
private _ctrlOK = _display displayCtrl 1;
private _ctrlCancel = _display displayCtrl 2;
if (_state) then {
    _bgCtrl ctrlSetPosition [W_PART(3.1667), H_PART(6.9875), W_PART(27), H_PART(12.125)];
    _bgCtrl ctrlCommit 0;
    _titleCtrl ctrlSetPosition [W_PART(3.1667), H_PART(5.8875), W_PART(27), H_PART(1)];
    _titleCtrl ctrlCommit 0;
    _contCtrl ctrlSetPosition [W_PART(3.6667), H_PART(6.9875), W_PART(27), H_PART(12.125)];
    _contCtrl ctrlCommit 0;
    private _stateCtrl = _display ctrlCreate ["RscText", 52527, _grpCtrl];
    _stateCtrl ctrlSetPosition [
        0,
        (H_PART(7.7)),
        (W_PART(10)),
        (H_PART(1))
    ];
    _stateCtrl ctrlSetText LELSTRING(zeus,LidState);
    _stateCtrl ctrlSetTooltip LELSTRING(ied,LidState_Tooltip);
    _stateCtrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
    _stateCtrl ctrlCommit 0;
    private _stateCombo = _display ctrlCreate ["RscCombo", 52528, _grpCtrl];
    _stateCombo ctrlSetPosition [
        (W_PART(10.1)),
        (H_PART(7.7)),
        (W_PART(15.9)),
        (H_PART(1))
    ];
    _stateCombo ctrlSetBackgroundColor [0, 0, 0, 0.5];
    _stateCombo lbAdd LELSTRING(ied,LidClosed);
    _stateCombo lbAdd LELSTRING(ied,LidOpen);
    _stateCombo lbSetCurSel 0;
    _stateCombo ctrlCommit 0;

    private _oceCtrl = _display ctrlCreate ["RscText", 52529, _grpCtrl];
    _oceCtrl ctrlSetPosition [
        0,
        (H_PART(8.8)),
        (W_PART(10)),
        (H_PART(1))
    ];
    _oceCtrl ctrlSetText LLSTRING(OpenCloseEOD);
    _oceCtrl ctrlSetTooltip LELSTRING(ied,OpenCloseEOD_Tooltip);
    _oceCtrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
    _oceCtrl ctrlCommit 0;
    private _oceSlider = _display ctrlCreate ["RscXSliderH", 52530, _grpCtrl];
    _oceSlider ctrlSetPosition [
        (W_PART(10.1)),
        (H_PART(8.8)),
        (W_PART(15.9)),
        (H_PART(1))
    ];
    _oceSlider ctrlCommit 0;    
    _oceSlider call FUNC(sliderMove);

    private _ocCtrl = _display ctrlCreate ["RscText", 52531, _grpCtrl];
    _ocCtrl ctrlSetPosition [
        0,
        (H_PART(9.9)),
        (W_PART(10)),
        (H_PART(1))
    ];
    _ocCtrl ctrlSetText LLSTRING(OpenClose);
    _ocCtrl ctrlSetTooltip LELSTRING(ied,OpenClose_Tooltip);
    _ocCtrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
    _ocCtrl ctrlCommit 0;
    private _ocSlider = _display ctrlCreate ["RscXSliderH", 52532, _grpCtrl];
    _ocSlider ctrlSetPosition [
        (W_PART(10.1)),
        (H_PART(9.9)),
        (W_PART(15.9)),
        (H_PART(1))
    ];
    _ocSlider ctrlCommit 0;
    _ocSlider call FUNC(sliderMove);
    
    _ctrlOK ctrlSetPosition [W_PART(25.1667), H_PART(19.2125), W_PART(5), H_PART(1)];
    _ctrlOK ctrlCommit 0;
    _ctrlCancel ctrlSetPosition [W_PART(3.1667), H_PART(19.2125), W_PART(5), H_PART(1)];
    _ctrlCancel ctrlCommit 0;
    _grpCtrl ctrlSetPosition [
        0,
        (H_PART(0.5)),
        (W_PART(26)),
        (H_PART(11))
    ];
    _grpCtrl ctrlCommit 0;
} else {
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        {
            private _ctrl = _display displayCtrl _x;
            private _ctrlPos = ctrlPosition _ctrl;
            private _newY = (_ctrlPos select 1) + (H_PART(1.1));
            _ctrlPos set [1, _newY];
            _ctrl ctrlSetPosition _ctrlPos;
            _ctrl ctrlCommit 0;
        } forEach [52511,52512,52513,52514,52515,52516,52521,52522,52523,52524,52525,52526];
        private _colorCtrl = _display ctrlCreate ["RscText", 52533, _grpCtrl];
        _colorCtrl ctrlSetPosition [
            0,
            (H_PART(1.1)),
            (W_PART(10)),
            (H_PART(1))
        ];
        _colorCtrl ctrlSetText LELSTRING(ied,Color);
        _colorCtrl ctrlSetTooltip LELSTRING(ied,Color_Tooltip);
        _colorCtrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
        _colorCtrl ctrlCommit 0;
        private _colorCombo = _display ctrlCreate ["RscCombo", 52534, _grpCtrl];
        _colorCombo ctrlSetPosition [
            (W_PART(10.1)),
            (H_PART(1.1)),
            (W_PART(15.9)),
            (H_PART(1))
        ];
        _colorCombo ctrlSetBackgroundColor [0, 0, 0, 0.5];        
        _colorCombo lbAdd LELSTRING(ied,Name_Green);
        _colorCombo lbSetData [0, "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_co.paa"];
        _colorCombo lbAdd LELSTRING(ied,Name_Blue);
        _colorCombo lbSetData [1, "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_Blue_co.paa"];
        _colorCombo lbAdd LELSTRING(ied,Name_Red);
        _colorCombo lbSetData [2, "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_red_co.paa"];
        _colorCombo lbAdd LELSTRING(ied,Name_White);
        _colorCombo lbSetData [3, "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_White_co.paa"];
        _colorCombo lbSetCurSel 0;
        _colorCombo ctrlCommit 0;

        _bgCtrl ctrlSetPosition [W_PART(3.1667), H_PART(7.72083), W_PART(27), H_PART(9.925)];
        _bgCtrl ctrlCommit 0;
        _titleCtrl ctrlSetPosition [W_PART(3.1667), H_PART(6.62083), W_PART(27), H_PART(1)];
        _titleCtrl ctrlCommit 0;
        _contCtrl ctrlSetPosition [W_PART(3.6667), H_PART(7.72083), W_PART(27), H_PART(9.925)];
        _contCtrl ctrlCommit 0;
        _ctrlOK ctrlSetPosition [W_PART(25.1667), H_PART(17.74583), W_PART(5), H_PART(1)];
        _ctrlOK ctrlCommit 0;
        _ctrlCancel ctrlSetPosition [W_PART(3.1667), H_PART(17.74583), W_PART(5), H_PART(1)];
        _ctrlCancel ctrlCommit 0;
        _grpCtrl ctrlSetPosition [
            0,
            (H_PART(0.5)),
            (W_PART(26)),
            (H_PART(8.8))
        ];
        _grpCtrl ctrlCommit 0;
    } else {
        _bgCtrl ctrlSetPosition [W_PART(3.1667), H_PART(8.0875), W_PART(27), H_PART(8.825)];
        _bgCtrl ctrlCommit 0;
        _titleCtrl ctrlSetPosition [W_PART(3.1667), H_PART(6.9875), W_PART(27), H_PART(1)];
        _titleCtrl ctrlCommit 0;
        _contCtrl ctrlSetPosition [W_PART(3.6667), H_PART(8.0875), W_PART(27), H_PART(8.825)];
        _contCtrl ctrlCommit 0;
        _ctrlOK ctrlSetPosition [W_PART(25.1667), H_PART(17.0125), W_PART(5), H_PART(1)];
        _ctrlOK ctrlCommit 0;
        _ctrlCancel ctrlSetPosition [W_PART(3.1667), H_PART(17.0125), W_PART(5), H_PART(1)];
        _ctrlCancel ctrlCommit 0;
        _grpCtrl ctrlSetPosition [
            0,
            (H_PART(0.5)),
            (W_PART(26)),
            (H_PART(7.7))
        ];        
        _grpCtrl ctrlCommit 0;
    };
};
