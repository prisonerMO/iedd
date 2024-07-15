class Title;
class Checkbox: Title
{
    class Controls {
        class Title;
        class Value;
    };
};
class CheckboxState: Checkbox
{
    class Controls {
        class Title;
        class Value;
    };
};
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
class GVAR(isCharge):CheckboxState {
    //attributeLoad = "		_checked = switch (true) do {			case (_value isequaltype 0): {([false,true] select (_value max 0 min 1))};			case (_value isequaltype ''): {([false,true] select ((parsenumber _value) max 0 min 1))};			default {_value};		};		(_this controlsGroupCtrl 100) cbsetchecked _checked;	";
	idc = 2020;
};
class GVAR(c_timer): Combo {};
class GVAR(isSuicide): Checkbox {
    class Controls: Controls {
        class Title: Title{};
        class Value: Value
        /*{

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
    };
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
    };";
        };
        \
        */
        {
            onCheckedChanged = "\
            _ctrlCheckbox = _this select 0;\
			_state = [true,false] select (cbChecked _ctrlCheckbox);\
			_fade = [0.75,0] select _state;\
            _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
            _all = (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
            _controls = _all select {ctrlclassname _x find [""iedd_ied"", 0] == 0};\
            _isCharge = _controls select {ctrlclassname _x == ""iedd_ied_isCharge""};\
            _isChargeCtrl =_isCharge select 0;\
            diag_log format [""%1"",_controls];\
            {\
                _ctrlclassname = ctrlclassname _x;\
                if (_ctrlclassname find [""iedd_ied"", 0] == 0) then {\
                    _x ctrlenable _state;\
                    _x ctrlsetfade _fade;\
                    _x ctrlcommit 0;\
                } else {
                    _x ctrlenable !_state;\
                    _x ctrlsetfade [0.75,0] select !_state;\
                    _x ctrlcommit 0;\
                };
            } foreach _controls-_isCharge;";
            onLoad = "\
            _this spawn {\
                disableserialization;\
                _ctrlCheckbox = _this select 0;\
				_state = [true,false] select (cbChecked _ctrlCheckbox);\
				_fade = [0.75,0] select _state;\
                _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
                _display = ctrlparent _ctrlCheckbox;\
                _allcontrols = (allcontrols _display - [ctrlParentControlsGroup _ctrlCheckbox]);\
                _isCharge = _allcontrols select {ctrlclassname _x == ""iedd_ied_isCharge""};\
                _isChargeGroup = _isCharge select 0;\
                _is = _display displayCtrl 2020;\
                _isChargeCtrl = (allcontrols _isChargeGroup) select 1;\
                _isChargeChecked =  cbChecked _isChargeCtrl;\
                diag_log format [""isCheck %1, name: %2  _displays %3, chargeControl %4, cb %5"",(_isChargeChecked), (_isCharge select 0), _display,ctrlChecked _is, cbchecked _is];\
                if !(_isChargeChecked) exitWith {diag_log ""exitWithSHIT""};\
                {\
                    _ctrlclassname = ctrlclassname _x;\
                    if (_ctrlclassname != ""iedd_ied_isCharge"" && _ctrlclassname find [""iedd_ied"", 0] == 0) then {\
                        _x ctrlenable _state;\
                        _x ctrlsetfade _fade;\
                        _x ctrlcommit 0;\
                    };\
                } foreach _allcontrols-_isCharge;\
            };";
        };
    };
};
