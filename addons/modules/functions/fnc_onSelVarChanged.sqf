#include "script_component.hpp"
params ["_control", "_curSel"];
if (_curSel < 0) exitWith {};
private _display = ctrlParent _control;
private _typeCtrl = _display displayCtrl 52520;
private _typeNum = lbCurSel _typeCtrl;
private _type = _typeCtrl lbData _typeNum;
private _varCtrl = _display displayCtrl 52521;
lbClear	_varCtrl;
private _data = "true" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values");
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
/*
private _ocCtrls = allControls _grpCtrl select {"openClose" in (ctrlClassName _x)};
private _color = [[0, 0, 0, 0.5],[1,1,1,1]] select _state; //TO DO GET CORRECT COLORS!
private _bgcolor = [[0, 0, 0, 0.2],[0, 0, 0, 0.5]] select _state; 
{
    _x ctrlSetTextColor _color;
    _x ctrlSetBackgroundColor _bgcolor;
    _x ctrlEnable _state;
} forEach _ocCtrls;
*/
if (_state) then {
    _bgCtrl ctrlSetPosition [W_PART(3.1667), H_PART(6.9875), W_PART(27), H_PART(11.025)];
    _bgCtrl ctrlCommit 0;
    _titleCtrl ctrlSetPosition [W_PART(3.1667), H_PART(5.8875), W_PART(27), H_PART(1)];
    _titleCtrl ctrlCommit 0;
    _contCtrl ctrlSetPosition [W_PART(3.6667), H_PART(6.9875), W_PART(27), H_PART(11.025)];
    _contCtrl ctrlCommit 0;
    private _ocCtrl = _display ctrlCreate ["RscText", 52527, _grpCtrl];
    _ocCtrl ctrlSetPosition [
        0,
        (H_PART(7.7)),
        (W_PART(10)),
        (H_PART(1))
    ];
    _ocCtrl ctrlSetText LLSTRING(OpenClose);
    _ocCtrl ctrlSetTooltip LELSTRING(ied,OpenClose_Tooltip);
    _ocCtrl ctrlSetBackgroundColor [0, 0, 0, 0.5];
    _ocCtrl ctrlCommit 0;
    private _ocSlider = _display ctrlCreate ["RscXSliderH", 52528, _grpCtrl];
    _ocSlider ctrlSetPosition [
        (W_PART(10.1)),
        (H_PART(7.7)),
        (W_PART(15.9)),
        (H_PART(1))
    ];
    _ocSlider ctrlCommit 0;    
    _ocSlider call FUNC(sliderMove);
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
    _ctrlOK ctrlSetPosition [W_PART(25.1667), H_PART(18.1125), W_PART(5), H_PART(1)];
    _ctrlOK ctrlCommit 0;
    _ctrlCancel ctrlSetPosition [W_PART(3.1667), H_PART(18.1125), W_PART(5), H_PART(1)];
    _ctrlCancel ctrlCommit 0;
    _grpCtrl ctrlSetPosition [
        0,
        (H_PART(0.5)),
        (W_PART(26)),
        (H_PART(9.9))
    ];
    _grpCtrl ctrlCommit 0;
} else {
    private _isOC = _grpCtrl controlsGroupCtrl 52527;
    if (!isNull _isOC) then {
        for "_i" from 52527 to 52530 do {
            private _ctrl = _display displayCtrl _i;
            ctrlDelete _ctrl;
        }; 
    };
    _bgCtrl ctrlSetPosition [W_PART(3.1667), H_PART(8.0875), W_PART(27), H_PART(8.825)];
    _bgCtrl ctrlCommit 0;
    _titleCtrl ctrlSetPosition [W_PART(3.1667), H_PART(6.9875), W_PART(27), H_PART(1)];
    _titleCtrl ctrlCommit 0;
    _contCtrl ctrlSetPosition [W_PART(3.6667), H_PART(8.0875), W_PART(27), H_PART(8.825)];
    _contCtrl ctrlCommit 0;
    _grpCtrl ctrlSetPosition [
        0,
        0,
        (W_PART(26)),
        (H_PART(7.7))
    ];
    _grpCtrl ctrlCommit 0.1;
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