class RscControlsGroupNoScrollbars;
class RscCombo;
class RscXSliderH;
class RscCheckBox;
class RscEdit;

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content;
        class ButtonOK;
        class ButtonCancel;
    };
};
class GVAR(label) {
    type = CT_STRUCTURED_TEXT;
    idc = -1;
    text = "";
    fixedWidth = 0;
    x = 0;
    y = 0;
    w = 0;
    h = 0;                          	
    style = ST_UPPERCASE;
    shadow = 1;
    colorShadow[] = { 0, 0, 0, 0.5 };
    font = "RobotoCondensed";
    size = GUI_TEXT_SIZE_MEDIUM;
    linespacing = 1;
    tooltipColorText[] = { 1, 1, 1, 1 };
    tooltipColorBox[] = { 1, 1, 1, 1 };
    tooltipColorShade[] = { 0, 0, 0, 0.65 };
    colorBackground[] = {0, 0, 0, 0.5};
};
#include "RscIeds.hpp"
#include "RscVbied.hpp"
#include "RscDecals.hpp"
#include "RscCharge.hpp"
#include "RscSuicide.hpp"
#include "RscBuryIED.hpp"
