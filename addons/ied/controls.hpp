class Title;
class Checkbox: Title
{
    class Controls {
        class Title;
        class Value;
    };
};
class CheckboxState;
class Slider;
class Combo;
class GVAR(timeSlider): Slider {
    attributeLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetPosition _value;\
    _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 's';";
    attributeSave = "params [""_ctrlGroup""];\
    sliderPosition (_ctrlGroup controlsGroupCtrl 100); ";
    onLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetSpeed [1, 1, 1];\
    _slider sliderSetRange [0, 300];\
    _slider ctrlAddEventHandler [""SliderPosChanged"", {\
        params [""_slider""];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 's';\
    }];\
    _edit ctrlAddEventHandler [""KillFocus"", {\
        params [""_edit""];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min 0) max 300;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 's';\
    }];";
};

class GVAR(distanceSlider): Slider {
    attributeLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetPosition _value;\
    _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';";
    attributeSave = "params [""_ctrlGroup""];\
    sliderPosition (_ctrlGroup controlsGroupCtrl 100); ";
    onLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetSpeed [1, 1, 1];\
    _slider sliderSetRange [0, 30];\
    _slider ctrlAddEventHandler [""SliderPosChanged"", {\
        params [""_slider""];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];\
    _edit ctrlAddEventHandler [""KillFocus"", {\
        params [""_edit""];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min 0) max 30;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];";
};


class GVAR(isHandcuffed): Checkbox {};
class GVAR(isSurrendered): Checkbox {};
class GVAR(isCharge):CheckboxState {};
class GVAR(c_timer): Combo {};
class GVAR(isSuicide): Checkbox {
    class Controls: Controls {
        class Title: Title{};
        class Value: Value
        {
            onCheckedChanged= "_ctrlCheckbox = _this select 0;\
                _state = [true,false] select (cbChecked _ctrlCheckbox);\
                _fade = [0.75,0] select _state;\
                diag_log format [""onCheckedChanged %1"",(allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox])];\
                diag_log format [""onCheckedChanged %1 , %2"", _state,_fade];";
    /*\or iedd_ied_attriubutes
    {\
        diag_log format [""onCheckedChanged %1"",_x];\
        if (ctrlclassname _x == 'iedd_ied_isCharge') then {\
            _x ctrlenable _state;\
            _x ctrlsetfade _fade;\
            _x ctrlcommit 0;\
            _ctrlCheckbox = _x controlsGroupCtrl 100;\
            _ctrlCheckbox ctrlshow _state;\
            _ctrlCheckboxDisabled = _x controlsGroupCtrl 101;\
            _ctrlCheckboxDisabled ctrlshow !_state;\
        };\
    } foreach (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
    };*/
            onLoad="_this spawn {\
        disableserialization;\
        _ctrlCheckbox = _this select 0;\
        _state = [true,false] select (cbChecked _ctrlCheckbox);\
        _fade = [0.75,0] select _state;\
        _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
            diag_log format [""onLOAD %1"",  allControls _ctrlGroup apply {ctrlclassname _x}];\
            diag_log format [""onLOAD %1"", (allcontrols (ctrlparent _ctrlCheckbox))];\
            }";/*\
        {\
            diag_log format [""onLoad %1"",_x];\  
            if (ctrlclassname _x == 'iedd_ied_isCharge') then {\
                _x ctrlenable _state;\
                _x ctrlsetfade _fade;\
                _x ctrlcommit 0;\
                _ctrlCheckbox = _x controlsGroupCtrl 100;\
                _ctrlCheckbox ctrlshow _state;\
                _ctrlCheckboxDisabled = _x controlsGroupCtrl 101;\
                _ctrlCheckboxDisabled ctrlshow !_state;\
            };\
        } foreach (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
    };";*/
        };
    };
};