#include "..\script_component.hpp"
params ["_type","_displayName", "_pos", "_dir", "_up"];
GVAR(userDefined) getOrDefaultCall [_type,{createHashMap}, true] getOrDefaultCall [_displayName, {createHashMap}, true] merge [createHashMapFromArray [
	["pos", _pos],
	["dir", _dir],
	["up", _up]
], true];

profileNamespace setVariable [QGVAR(userDefined), GVAR(userDefined)];