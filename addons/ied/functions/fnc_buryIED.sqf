#include "..\script_component.hpp"
/*
 * Author: Prisoner 404
 * Bury IED
 *
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call iedd_ied_fnc_buryIED
 *
 * Public: No
 */

//params [];
//TRACE_1("fnc_buryIED",_this);
params [
    ["_obj",objNull],
    ["_value",-1],
    ["_pos",getPosATL /*getPosASL*/ (_this select 0)]
];
if (isNull _obj) exitWith {"systemChat 'Object is null'";};
diag_log format["IEDD: Bury IED: %1",_value];
if (is3DEN) then {
    TRACE_2("is3den, This:",is3DEN,_this);
    _pos set [2,0];
};
if (_value < 0.1) exitWith {
    _pos set [2,0];
    _obj setPosATL _pos;
}; // Min depth 10%
_obj setVariable [QGVAR(bury),_value,true];
private _depth = getNumber (configFile >> "CfgVehicles" >> typeOf _obj >> "iedd_ied_buryDepth");
for "_i" from 0.01 to _value step 0.01 do {
    private _terrainNormal = surfaceNormal _pos;
    private _newNormal = _terrainNormal vectorMultiply (abs(_depth));
    private _newPos = _pos vectorAdd [-(_newNormal #0), -(_newNormal #1), -(_newNormal #2)];
    _obj setPosATL _newPos;
    _pos = _newPos;
};/*
_value = _value - 1;
TRACE_1("Bury:",_value);
private _terrainNormal = surfaceNormal _pos;
private _depth = getNumber (configFile >> "CfgVehicles" >> typeOf _obj >> "iedd_ied_buryDepth");
private _newNormal = _terrainNormal vectorMultiply (abs(_depth));
private _newPos = _pos vectorAdd [-(_newNormal #0), -(_newNormal #1), -(_newNormal #2)];
//_obj setPosASL _newPos;
_obj setPosATL _newPos;
[_obj,_value,_newPos] call iedd_ied_fnc_buryIED;
*/