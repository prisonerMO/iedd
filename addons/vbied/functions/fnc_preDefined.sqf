#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add model and values to the preDefined hashmap.
 *
 * Arguments:
 * 0: Type <STRING>
 * 1: Key <NUMBER>
 * 2: Position <ARRAY of NUMBERS>
 * 3: Direction <ARRAYo f NUMBERS>
 * 4: Up <ARRAY of NUMBERS>
 * 5: Position name <STRING>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * ["van_01_transport_f.p3d",0,[0,0,0],[0,0,0],[0,0,0],"Front"] call iedd_vbied_fnc_preDefined;
 *
 * Public: No
 */

params ["_type","_loc", "_pos", "_dir", "_up","_text"];
TRACE_1("fnc_preDefined",_this);

GVAR(preDefined) getOrDefaultCall [_type,{createHashMap}, true] getOrDefaultCall [_loc, {createHashMap}, true] merge [createHashMapFromArray [
	["pos", _pos],
	["dir", _dir],
	["up", _up],
	["text",_text]
], true];