#define ATTRIBUTE_Y_VALUE   0.80
#define ATTRIBUTE_H_VALUE   15
#define GRID_Y_POS (GRID_H * ATTRIBUTE_Y_VALUE)
#define GRID_H_POS (GRID_H * ATTRIBUTE_H_VALUE)
#define GRID_W_POS (GRID_H * ATTRIBUTE_H_VALUE)
#define CTRL_H(H) H * 4.5 * GRID_H
#define CTRL_DEFAULT_H (SIZE_M * GRID_H)
#define EDIT_W 3.3
class ctrlCheckbox;
class ctrlControlsGroup;
class ctrlStatic;
class ctrlEdit;
class ctrlCombo;
class ctrlButton;

class Cfg3DEN {
    class Attributes {
        #include "controls.hpp"
    };
    class object {
        class AttributeCategories {
           #include "vbied_attributes.hpp"
        };
    };
};
