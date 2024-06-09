#include "script_component.hpp"
params ["_bombObj"];
private _pos = getPosATL _bombObj;
private _type = typeOf _bombObj;
deleteVehicle _bombObj;
[
    {
        params ["_bombObj","",""];
        isNull _bombObj;
    }, 
    {
        params ["_bombObj","_pos","_type"];
        _bombObj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
    }, 
    [_bombObj,_pos,_type]
] call CBA_fnc_waitUntilAndExecute;
