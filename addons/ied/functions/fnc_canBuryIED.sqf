#include "script_component.hpp"
/*
 * Author: Prisoner
 * Check if the the IED can be buried
 *
 * Arguments:
 * 0: Unit or Position (2d/3d) <OBJECT or ARRAY>
 *
 * Return Value:
 * True <BOOL> - Returns true if the player can dig the IED.
 *
 * Example:
 * [ACE_player] call iedd_ied_fnc_canBuryIED;
 * [[1000,2000]] call iedd_ied_fnc_canBuryIED;
 *
 * Public: No
 */
params ["_input"];

private _posASL = _input;

if ((_input isEqualType objNull) && {
    _posASL = getPosASL _input;
    private _getPosATL = getPosATL _input;
    private _pos = _input modelToWorld [0,0,0];
    private _worldPos = _pos #2;
    private _atlPos = _getPosATL #2;
    _getPosATL set [2, _atlPos-_worldPos];
    _getPosATL select 2 > 0.05 ||
    {surfaceIsWater _posASL}
}) exitWith {false};

private _surfaceClass = (surfaceType _posASL) select [1];
private _config = configFile >> "CfgSurfaces" >> _surfaceClass;

TRACE_3("",_surfaceClass,getText (_config >> "soundEnviron"),getNumber (_config >> "dust"));

if (isNumber (_config >> "ACE_canDig")) then {
    (getNumber (_config >> "ACE_canDig")) == 1 // return
} else {
    private _surfaceType = getText (_config >> "soundEnviron");
    GVAR(canDigSurfaces) getOrDefault [_surfaceType, getNumber (_config >> "dust") >= 0.1, true] // return
};


