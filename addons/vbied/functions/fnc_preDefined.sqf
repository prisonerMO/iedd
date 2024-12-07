#include "..\script_component.hpp"
params ["_type","_loc", "_pos", "_dir", "_up","_text"];
GVAR(preDefined) getOrDefaultCall [_type,{createHashMap}, true] getOrDefaultCall [_loc, {createHashMap}, true] merge [createHashMapFromArray [
	["pos", _pos],
	["dir", _dir],
	["up", _up],
	["text",_text]
], true];