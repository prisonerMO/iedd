#include "script_component.hpp"
params ["_target", "_player", "_params"];
//TO-DO add check if QGVAR(bomb) == true, then do may explose?
_target animate ["bucketlid_hide", 1];