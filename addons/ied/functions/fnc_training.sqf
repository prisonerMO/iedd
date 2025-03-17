#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add training variables to IED
 *
 * Arguments:
 * 0: Bomb Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bombObj] call iedd_ied_fnc_training
 *
 * Public: No
 */

params ["_bombObj"];
TRACE_1("fnc_training",_this);

_bombObj setVariable [QGVAR(training),true,true];
_bombObj setVariable [QGVAR(decals),false];
_bombObj setVariable [QGVAR(fake),0,true];
_bombObj setVariable [QGVAR(dir),false];
private _type = typeOf _bombObj;
switch (_type) do {
    case "iedd_ied_Training_CanisterPlastic": {[_bombObj] call FUNC(canister)};
    case "iedd_ied_Training_CanisterFuel": {[_bombObj] call FUNC(jerry)};
    case "iedd_ied_Training_Cardboard": {[_bombObj] call FUNC(cardboard)};
    case "iedd_ied_Training_Cinder": {[_bombObj] call FUNC(cinder)};
    case "iedd_ied_Training_Metal": {[_bombObj] call FUNC(metal)};
    case "iedd_ied_Training_Metal_English": {[_bombObj] call FUNC(metal)};
    case "iedd_ied_Training_Barrel": {[_bombObj] call FUNC(barrel)};
    case "iedd_ied_Training_Barrel_Grey": {[_bombObj] call FUNC(barrel)};
    case "iedd_ied_Training_Bucket": {[_bombObj] call FUNC(bucket)};
    default {};
};
