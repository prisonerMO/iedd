class Default; // Empty template with pre-defined width and single line height
class Title: Default
{
    class Controls {
        class Title;
    };
};
class Combo: Title
{
    class Controls: Controls
    {
        class Title;
        class Value;
    };
};
class Edit;
class EditXYZ;
class SubCategory;
class Checkbox;
class Slider;

class GVAR(Checkbox): Checkbox {};
class GVAR(Combo): Combo {};
class GVAR(PosCombo): Title {
    idc = 95441;
    attributeLoad = "[_this,_value] call iedd_vbied_fnc_pos_onAttributeLoad";
    attributeSave = "_this call iedd_vbied_fnc_pos_onAttributeSave";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlCombo {
            idc = 100;
            onLBselChanged = "_this call iedd_vbied_fnc_pos_onLBSelChanged";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_W * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
        };
    };
};
class GVAR(Sub): SubCategory {};
class GVAR(SubVbied): SubCategory {
    attributeLoad = "[_this, _config, _value] call iedd_vbied_fnc_model_onAttributeLoad";
};
class GVAR(UserDefined): EditXYZ {};
class GVAR(SaveDelete): Title
{
    //onLoad = "diag_log format ['onLoad SAVEDEL %1', _this]";
    //attributeLoad = "diag_log format ['onLoadAttribute SAVEDEL %1', _this]";
    //attributeSave = "diag_log format ['onSaveAttribute SAVEDEL %1', _this]";
    h = QUOTE((2.5 * GRID_H) + CTRL_H(1));
    class Controls
    {
        class Title: Title{};
        class Save: ctrlButton
        {
            idc = -1;
            text = CSTRING(Save);
            tooltip = CSTRING(Save_Tooltip);
            onButtonClick = "_this call iedd_vbied_fnc_save_onButtonClick";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_H * GRID_W * 3);
            h = QUOTE(ATTRIBUTE_CONTENT_H * GRID_H);
        };
        class Delete: Save
        {
            text = CSTRING(Delete);
            tooltip = CSTRING(Delete_Tooltip);
            onButtonClick = "_this call iedd_vbied_fnc_delete_onButtonClick";
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (1/3) + ATTRIBUTE_CONTENT_H) * GRID_W);
        };
    };
};
class GVAR(Edit): Edit{};

class GVAR(speedSlider): Slider {
    attributeLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetPosition _value;\
    _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'km/h';";
    attributeSave = "params [""_ctrlGroup""];\
    sliderPosition (_ctrlGroup controlsGroupCtrl 100); ";
    onLoad = "params [""_ctrlGroup""];\
    private _slider = _ctrlGroup controlsGroupCtrl 100;\
    private _edit = _ctrlGroup controlsGroupCtrl 101;\
    _slider sliderSetSpeed [1, 1, 1];\
    _slider sliderSetRange [0, 150];\
    _slider ctrlAddEventHandler [""SliderPosChanged"", {\
        params [""_slider""];\
        private _edit = (ctrlParentControlsGroup _slider) controlsGroupCtrl 101;\
        private _value = sliderPosition _slider;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'km/h';\
    }];\
    _edit ctrlAddEventHandler [""KillFocus"", {\
        params [""_edit""];\
        private _slider = (ctrlParentControlsGroup _edit) controlsGroupCtrl 100;\
        private _value = ((parseNumber ctrlText _edit) min 0) max 300;\
        _slider sliderSetPosition _value;\
        _edit ctrlSetText ([_value, 0] call CBA_fnc_formatNumber) + 'km/h';\
    }];";
};