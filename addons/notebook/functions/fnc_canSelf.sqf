#include "script_component.hpp"
params ["_unit", "_item"];
(_item in items _unit &&
{cameraOn == vehicle _unit})