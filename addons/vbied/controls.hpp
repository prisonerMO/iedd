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
            text = "SAVE";
            onButtonClick = "_this call iedd_vbied_fnc_save_onButtonClick_local";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_H * GRID_W * 3);
            h = QUOTE(ATTRIBUTE_CONTENT_H * GRID_H);
        };
        class Delete: Save
        {
            text = "DELETE";
            onButtonClick = "_this call iedd_vbied_fnc_delete_onButtonClick_local";
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (1/3) + ATTRIBUTE_CONTENT_H) * GRID_W);
        };
    };
};
class GVAR(Edit): Edit{};