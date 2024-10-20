#include "..\script_component.hpp"
params ["_control","_config","_value"];
diag_log format ["modelAttributeLoad: %1",_this];
GVAR(preDefined) set ["model",_value];
