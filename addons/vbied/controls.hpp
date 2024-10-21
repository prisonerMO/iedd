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
class SubCategoryNoHeader1: Default
{
    class Controls
    {
        class Group: ctrlControlsGroup
        {
            class Controls
            {
                class Title;
                class DescriptionDeco;
                class Description;
            };
        };
    };
};

class GVAR(Checkbox): Checkbox {};
class GVAR(Combo): Combo {};
class GVAR(PosCombo): Title {
    //onLoad = "_this call iedd_vbied_fnc_pos_onLoad";
    attributeLoad = "_this call iedd_vbied_fnc_pos_onAttributeLoad";
    attributeSave = "_this call iedd_vbied_fnc_pos_onAttributeSave";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlCombo {
            idc = 100;
            onLBselChanged = "_this call iedd_vbied_fnc_pos_onLBSelChanged";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_W * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
            class Items
            {
                class TEXT_1
                {
                    text = "NEW DEFINED POSITION";
                    tooltip = "USER DEFINED POSITION";
                    default = 1;
                };
            };
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
            onButtonClick = "diag_log format ['button SAVE %1', _this]";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_H * GRID_W * 3);
            h = QUOTE(ATTRIBUTE_CONTENT_H * GRID_H);
        };
        class Delete: Save
        {
            text = "DELETE";
            onButtonClick = "diag_log format ['button DELETE %1', _this]";
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (1/3) + ATTRIBUTE_CONTENT_H) * GRID_W);
        };
    };
};
/*
class GVAR(PosCombo): Title {
    onLoad = "_this call iedd_vbied_fnc_pos_onLoad";
    attributeLoad = "";
    //attributeLoad = "call iedd_vbied_fnc_pos_onAttributeLoad";
    attributeSave = "call iedd_vbied_fnc_pos_onAttributeSave";
    class Controls: Controls {
        class Title: Title {};
        class Value: ctrlCombo
        {
            idc = 100;
            onLBselChanged = "_this call iedd_vbied_fnc_pos_onLBSelChanged";
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_W * GRID_W);
            h = QUOTE(CTRL_DEFAULT_H);
            class Items
            {
                class TEXT_1
                {
                    text = "NEW DEFINED POSITION";
                    tooltip = "USER DEFINED POSITION";
                    data = 1;
                    default = 0;
                };
            };
        };
    };
};
*/
/*
class GVAR(testCombo) : Title
{
    // Expression called when the control is loaded, used to apply the value
    // Passed params are: _this - control, _value - saved value
    attributeLoad = "[_this, _config, _value] call iedd_vbied_fnc_pos_onAttributeLoad";
    // Expression called when attributes window is closed and changes confirmed. Used to save the value.
    // Passed param: _this - control
    attributeSave =    "_ctrl = (_this controlsGroupCtrl 100); _ctrl lbData (lbCurSel _ctrl);";

    // List of controls, structure is the same as with any other controls group
    // Static items
    class Controls {
        class Title: Title{}; // Inherit existing title control. Text of any control with class Title will be changed to attribute displayName
        class Value: ctrlCombo
        {
            idc = 100;

            // Static items
            class Items
            {
                class TEXT_1
                {
                    text = "TEXT_1";
                    data = "1";
                    default = 0;
                };
                class TEXT_2
                {
                    text = "TEXT_2";
                    data = "2";
                };
            };
            class ItemsConfig
            {
                path[] = {"CfgTestCombo"}; // Path to config container
                localConfig = 1; // 1 to search local Description.ext as well
                // Name of the property which will be used for item text
                propertyText = "title";
                // Name of the property which will be used for data
                propertyData = "data";
            };
        };
    };
};
*/
/*
class GVAR(SubModel): SubCategoryNoHeader1
{
    //onLoad = "_this call iedd_vbied_fnc_onLoad";
    attributeLoad = "[_this, _config, _value] call iedd_vbied_fnc_model_onAttributeLoad";
    attributeSave = "";
    h = QUOTE((2.5 * GRID_H) + CTRL_H(1));
    class Controls: Controls
    {
        class Group: Group
        {
            h = QUOTE(CTRL_H(1));
            class Controls: Controls
            {
                class Title: ctrlStatic
                {
                    h = QUOTE(CTRL_H(1));
                };
                class DescriptionDeco: DescriptionDeco
                {
                    h = QUOTE(CTRL_H(1));
                };
                class Description: Description
                {
                    h = QUOTE(CTRL_H(1));
                };
            };
        };
    };
};
*/
//JOHONKIN ONLOAD DEFAUL VALUE TYPE OF VEHICLE
// GET SET JA SEMMOSTA PASKAA
/*
class GVAR(SubAllowed): SubCategoryNoHeader1
{
    //onLoad = "_this call iedd_vbied_fnc_onLoad";
    attributeLoad = "[_this, _config, _value] call iedd_vbied_fnc_allowed_onAttributeLoad";
    attributeSave = "";
    h = QUOTE((2.5 * GRID_H) + CTRL_H(3));
    GVAR(nonAllowed) = "";
    GVAR(allowed) = "";

    class Controls: Controls
    {
        class Group: Group
        {
            h = QUOTE(CTRL_H(3));
            class Controls: Controls
            {
                class Title: ctrlStatic
                {
                    h = QUOTE(CTRL_H(3));
                };
                class DescriptionDeco: DescriptionDeco
                {
                    h = QUOTE(CTRL_H(3));
                };
                class Description: Description
                {
                    h = QUOTE(CTRL_H(3));
                };
            };
        };
    };
};
*/

/*
class GVAR(UserDefined): Title
{
    idc = 100;
    attributeLoad = "[_this,_value] call iedd_vbied_fnc_userDefined_onAttributeLoad";
    attributeSave = "[_this,_value] call iedd_vbied_fnc_userDefined_onAttributeSave";
    class Controls: Controls
    {
        class Title: Title {};
        class TitleX: ctrlStatic
        {
            text = "$STR_3DEN_Axis_X";
            style = 2;
            shadow = 0;
            x = QUOTE(ATTRIBUTE_TITLE_W * GRID_W);
            w = QUOTE(ATTRIBUTE_CONTENT_H * GRID_W);
            h = QUOTE(ATTRIBUTE_CONTENT_H * GRID_H);
            colorBackground[] = {0.77,0.18,0.1,1};
        };
        class ValueX: ctrlEdit
        {
            idc = 101;
            text = "0";
            x = QUOTE((ATTRIBUTE_TITLE_W + ATTRIBUTE_CONTENT_H) * GRID_W);
            w = QUOTE((ATTRIBUTE_CONTENT_W / 3 -	ATTRIBUTE_CONTENT_H) * GRID_W);
            h = QUOTE(ATTRIBUTE_CONTENT_H * GRID_H);
            font = "EtelkaMonospacePro";
            sizeEx = QUOTE(3.875 * 1 / CENTER_Y);
        };
        class TitleY: TitleX
        {
            text = "$STR_3DEN_Axis_Y";
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (1/3)) * GRID_W);
            colorBackground[] = {0.58,0.82,0.22,1};
        };
        class ValueY: ValueX
        {
            idc = 102;
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (1/3) + ATTRIBUTE_CONTENT_H) * GRID_W);
        };
        class TitleZ: TitleX
        {
            text = "$STR_3DEN_Axis_Z";
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (2/3)) * GRID_W);
            colorBackground[] = {0.26,0.52,0.92,1};
        };
        class ValueZ: ValueX
        {
            idc = 103;
            x = QUOTE((ATTRIBUTE_TITLE_W + 	ATTRIBUTE_CONTENT_W * (2/3) + ATTRIBUTE_CONTENT_H) * GRID_W);
        };
    };
};
*/