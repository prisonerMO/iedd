#include "..\script_component.hpp"
/*
 * Authors: Prisoner
 * Dig buried IED.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: Some param <ANY>
 * 2: Some other param <ANY>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call iedd_ied_fnc_dig
 *
 * Public: No
 */

params [
    ["_obj",objNull],
    ["_count",0],
    ["_pos",getPosATL /*getPosASL*/ (_this select 0)],
    ["_depth",000.1]
];
TRACE_1("fnc_dig",_this);
diag_log format ["IEDD: Digging IED %1",_this];
if (isNull _obj) exitWith {"systemChat 'Object is null'";};
if (_count < 1) exitWith {
    _pos set [2,0];
    _obj setPosATL _pos;
    _obj setVariable [QGVAR(isDigging),false,true];
    _obj setVariable [QGVAR(bury),-1,true];
    private _attachedObjects = attachedObjects _obj;
    {
        ["iedd_ied_hideObject",[_x, false]] call CBA_fnc_globalEvent;
    } forEach _attachedObjects;
    _obj enableSimulationGlobal true;
}; // Min depth 10%

_count = _count - 1;
TRACE_1("Bury:",_count);
private _terrainNormal = surfaceNormal _pos;
private _newNormal = _terrainNormal vectorMultiply ((_depth));
private _newPos = _pos vectorAdd [-(_newNormal #0), -(_newNormal #1), (_newNormal #2)];
//_obj setPosASL _newPos;
_obj setPosATL _newPos;
[{call FUNC(dig)},[_obj,_count,_pos,_depth],1] call CBA_fnc_waitAndExecute;




