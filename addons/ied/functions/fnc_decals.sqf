#include "script_component.hpp"
/*
 * Author: Prisoner
 * Creates a decal on the ground.
 *
 * Arguments:
 * 0: The position to create the decal <ARRAY>
 * 1: The type of decal to create <STRING> 
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosATL player, "Land_Decal_RoadEdge_Dirt_03_F"] call iedd_ied_fnc_decals;
 *
 * Public: No
 */

params ["_pos",["_type",selectRandom IEDD_DECALS]];
TRACE_1("fnc_decals",_this);

private _decalPos =
if (_pos isEqualType []) then {
    _pos;
} else {
    getPosATL _pos;
};
private _decal = createVehicle [_type, _decalPos, [], 0, "CAN_COLLIDE"];
_decal setDir random 359;
_decal setPosATL [_decalPos #0, _decalPos #1, 0];
_decal setVectorUp surfaceNormal position _decal;
