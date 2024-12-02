class Default; //Empty template with pre-defined width and single line height
class Title: Default
{
    class Controls
    {
        class Title;
    };
};
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
class GVAR(distanceActivate): GVAR(distanceSlider) {
    onLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetSpeed [1, 1, 1];\
    _slider sliderSetRange [0, 1000];\
    _slider ctrlAddEventHandler [""SliderPosChanged"", {\
        params [""_slider""];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];\
    _edit ctrlAddEventHandler [""KillFocus"", {\
        params [""_edit""];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min 0) max 1000;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];";
};
class GVAR(distanceExplosion): GVAR(distanceSlider) {
    onLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetSpeed [1, 1, 1];\
    _slider sliderSetRange [0, 50];\
    _slider ctrlAddEventHandler [""SliderPosChanged"", {\
        params [""_slider""];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];\
    _edit ctrlAddEventHandler [""KillFocus"", {\
        params [""_edit""];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min 0) max 50;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'm';\
    }];";
};


class GVAR(isHandcuffed): Checkbox {};
class GVAR(isSurrendered): Checkbox {};
class GVAR(isCharge): CheckboxState {
    class Controls: Controls
    {
        class Title: Title{};
        class Value: Value
        {
            onCheckedChanged ="\
            private _ctrlCheckbox = _this select 0;\
            private _state = [false,true] select (cbChecked _ctrlCheckbox);\
            private _fade = [0.75,0] select _state;\
            private _ctrlGroup = ctrlParentControlsGroup ctrlParentControlsGroup _ctrlCheckbox;\
            private _all = (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
            {\
                    if (ctrlParentControlsGroup _x == _ctrlGroup) then {\
                        _x ctrlenable _state;\
                        _x ctrlsetfade _fade;\
                        _x ctrlcommit 0;\
                    };\
            } foreach _all;
            if (_state) then {\
                private _isSuicide = _all select {ctrlclassname _x == ""iedd_ied_isSuicide""};\
                private _isSuicideGrp = allcontrols (_isSuicide select 0);\
                private _isSuicideCtrl = _isSuicideGrp select 1;\
                private _isState =  cbChecked _isSuicideCtrl;\
                private _controls = _all select {""iedd_ied"" in ctrlclassname _x};
                {\
                    private _ctrlclassname = ctrlclassname _x;\
                    if (""dist"" in _ctrlclassname) then {\
                        _x ctrlenable _isState;\
                        _x ctrlsetfade ([0.75,0] select _isState);\
                        _x ctrlcommit 0;\
                    } else {\
                        _x ctrlenable !_isState;\
                        _x ctrlsetfade ([0.75,0] select !_isState);\
                        _x ctrlcommit 0;\
                    };\
                } forEach _controls - _isSuicide;\
            };";
        };
    };
};
class GVAR(c_timer): Combo {};
class GVAR(isSuicide): Checkbox {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value
        {
            onCheckedChanged = "\
            private _ctrlCheckbox = _this select 0;\
			private _state = [true,false] select (cbChecked _ctrlCheckbox);\
			private _fade = [0.75,0] select _state;\
            private _all = (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
            private _controls = _all select {ctrlclassname _x find [""iedd_ied"", 0] == 0};\
            private _isCharge = _controls select {ctrlclassname _x == ""iedd_ied_isCharge""};\
            {\
                private _ctrlclassname = ctrlclassname _x;\
                if !(""dist"" in _ctrlclassname) then {\
                    _x ctrlenable _state;\
                    _x ctrlsetfade _fade;\
                    _x ctrlcommit 0;\
                    private _type = (allcontrols _x) select 1;\
                    if (!_state && ctrltype _type == 77) then {\
                        _type cbSetChecked false;\
                    };\
                } else {\
                    _x ctrlenable !_state;\
                    _x ctrlsetfade ([0.75,0] select !_state);\
                    _x ctrlcommit 0;\
                };\
            } foreach _controls-_isCharge;";
            onLoad = "\
            _this spawn {\
                disableserialization;\
                private _ctrlCheckbox = _this select 0;\
				private _state = [true,false] select (cbChecked _ctrlCheckbox);\
				private _fade = [0.75,0] select _state;\
                private _all = (allcontrols (ctrlparent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);\
                private _controls = _all select {ctrlclassname _x find [""iedd_ied"", 0] == 0};\
                private _isCharge = _controls select {ctrlclassname _x == ""iedd_ied_isCharge""};\
                private _isChargeGroup = _isCharge select 0;\
                private _isChargeCtrl = (allcontrols _isChargeGroup) select 1;\
                private _isChargeChecked =  cbChecked _isChargeCtrl;\
                if !(_isChargeChecked) exitWith {};\
                {\
                    private _ctrlclassname = ctrlclassname _x;\
                    if !(""dist"" in _ctrlclassname) then {\
                        _x ctrlenable _state;\
                        _x ctrlsetfade _fade;\
                        _x ctrlcommit 0;\
                    } else {\
                        _x ctrlenable !_state;\
                        _x ctrlsetfade ([0.75,0] select !_state);\
                        _x ctrlcommit 0;\
                    };\
                } foreach _controls-_isCharge;\
            };";
        };
    };
};
class GVAR(distDMS): Checkbox {};
class GVAR(distSides): Checkbox {
    attributeLoad = "[_this, _value] call iedd_ied_fnc_sides_onAttributeLoad";
	attributeSave = "[\
        [-1, 0] select (cbChecked (_this controlsGroupCtrl 100)),\
        [-1, 1] select (cbChecked (_this controlsGroupCtrl 101)),\
        [-1, 2] select (cbChecked (_this controlsGroupCtrl 102)),\
        [-1, 3] select (cbChecked (_this controlsGroupCtrl 103))];";
    h = QUOTE(GRID_H_POS);
    class Controls: Controls {
        class Title: Title{};
        class EastV: ctrlCheckbox
		{
            idc = 100;
            y = QUOTE(GRID_Y_POS);
            x = QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W * 1/30) * GRID_W);
            w = QUOTE(GRID_W_POS);
            h = QUOTE(GRID_H_POS);
            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa";
            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_east_ca.paa";
            tooltip="$STR_EAST";
		};
        class WestV: EastV
		{
            idc = 101;
			x=QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W * 1/4) * GRID_W);
            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa";
            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_west_ca.paa";
            tooltip="$STR_WEST";
		};
        class GuerV: EastV
		{
            idc = 102;
            x=QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W * 2/4) * GRID_W);
            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa";
            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_guer_ca.paa";
            tooltip="$STR_Guerrila";
		};
        class CivV: EastV
		{
            idc = 103;
            x=QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_W * 3/4) * GRID_W);
            textureChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
            textureUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
            textureFocusedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
            textureFocusedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
            textureHoverChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
            textureHoverUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
            texturePressedChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
            texturePressedUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
            textureDisabledChecked = "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa";
            textureDisabledUnchecked = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\side_civ_ca.paa";
            tooltip="$STR_Civilian";
		};
    };
};