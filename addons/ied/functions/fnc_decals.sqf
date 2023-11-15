#include "script_component.hpp"
params ["_pos",["_type",selectRandom IEDD_DECALS]];

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
