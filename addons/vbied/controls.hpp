class Default; // Empty template with pre-defined width and single line height
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
class Combo;
class SubCategory;
class Edit;

class GVAR(Checkbox): Checkbox {
    class Controls: Controls {
        class Title: Title {};
        class Value: Value {};
    };
};

class GVAR(Combo): Combo {};
class GVAR(PosCombo): Combo {
    onLBListSelChanged = "call iedd_vbied_fnc_pos_onLBListSelChanged";
};
class GVAR(Sub): SubCategory {};
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
class GVAR(UserDefined): Title
{
    attributeLoad = "_this call iedd_vbied_fnc_userDefined_onAttributeLoad";
    attributeSave = "_this call iedd_vbied_fnc_userDefined_onAttributeSave";
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