#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;
if (isServer) then {
    {
        [_x, "Deleted", {(_this select 0) call FUNC(deleted)}, true, [], true] call CBA_fnc_addClassEventHandler;
    } forEach IEDD_BASE_CLASSES;
    GVAR(bombs) = [];
};

GVAR(canDigSurfaces) = createHashMapFromArray [
    ["int_concrete",false],["int_pavement_exp",false],["int_solidwood_exp",false],["tiling",false],["roof_tiles",false],["stony",false],
    ["wavymetal",false],["int_wood",false],["int_tiles",false],["softwood_exp",false],["int_concrete_exp",false],["tiles_int",false],
    ["metalplate_exp",false],["int_metalplate_exp",false],["steel_exp",false],["metal",false],["int_lino_exp",false],["metal_int",false],
    ["wavymetal_exp",false],["int_metal",false],["asphalt_exp",false],["pavement_exp",false],["gridmetal_exp",false],
    ["rooftiles_exp",false],["rock",false],["int_mat_exp",false],["wood_int",false],["concrete_int",false],["tarmac",false],["wood",false],
    ["roof_tin",false],["lino_exp",false],["concrete",false],["int_softwood_exp",false], ["concrete_exp",false],["stones_exp",false],
    ["forest_exp",true],["snow",true],["grasstall_exp",true],["grass",true],["forest",true],["drygrass",true]
];

#include "initSettings.inc.sqf"

ADDON = true;
