#include "script_component.hpp"
params ["_bombObj","_useRandom"];
private _pos = getPosATL _bombObj;
private _type = typeOf _bombObj;
private _varData = "getText (_x >> 'name') isEqualTo localize 'STR_iedd_ied_Name_Random'" configClasses (configFile >> "CfgVehicles" >> _type >> "Attributes" >> "iedd_ied_variation" >> "Values") apply {getNumber (_x >> 'value')};
private _random = _varData select 0; 
private _variation = if (_useRandom) then {
    _random
} else {
    _bombObj getVariable ["iedd_ied_variation", _random];
};
private _dir = getDir _bombObj;
private _vectorDir = vectorDir _bombObj;
private _vectorUp = vectorUp _bombObj;
private _vectorDirAndUp = [_vectorDir,_vectorUp];
deleteVehicle _bombObj;
[
    {
        params ["_bombObj","",""];
        isNull _bombObj;
    }, 
    {
        params ["_bombObj","_pos","_type","_variation","_dir","_vectorDirAndUp"];
        _bombObj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
        _bombObj setVariable [QGVAR(variation), _variation, true];
        _bombObj setDir _dir;    
        _bombObj setVectorDirAndUp _vectorDirAndUp;
        _bombObj setPosATL _pos;
    },
    [_bombObj,_pos,_type,_variation,_dir,_vectorDirAndUp]
] call CBA_fnc_waitUntilAndExecute;
