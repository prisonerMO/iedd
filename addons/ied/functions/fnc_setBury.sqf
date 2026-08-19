#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Buries or unburies the given IED(s) directly, without the interactive Zeus "Bury IED"
 * module dialog. Reuses fnc_buryIED.sqf for the actual position/rotation math.
 *
 * Arguments:
 * 0: IED objects <ARRAY of OBJECTS>
 * 1: Depth in steps, 0-20; 0 unburies and restores the original position <NUMBER>
 * 2: [Vector Dir, Vector Up] to bury at, defaults to each object's current orientation (optional) <ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: Server only
 */

params ["_objects", ["_depth", 10, [0]], ["_vectorDirUp", [], [[]]]];

{
    private _ied = _x;
    private _isBury = _ied getVariable [QGVAR(isBury), false];

    if (_depth > 0 && {_isBury}) exitWith {}; // already buried
    if (_depth <= 0 && {!_isBury}) exitWith {}; // already unburied

    if (_depth > 0) then {
        private _vectorDir = if (_vectorDirUp isEqualTo []) then {vectorDir _ied} else {_vectorDirUp select 0};
        private _vectorUp = if (_vectorDirUp isEqualTo []) then {vectorUp _ied} else {_vectorDirUp select 1};
        _ied setVariable [QGVAR(bury), [_depth, _vectorDir, _vectorUp]];
        _ied setVariable [QGVAR(isBury), true, true];
    } else {
        // Keep the stored pre-bury vectorDir/vectorUp so fnc_buryIED.sqf restores the original orientation
        private _bury = _ied getVariable [QGVAR(bury), [0, vectorDir _ied, vectorUp _ied]];
        _bury set [0, 0];
        _ied setVariable [QGVAR(bury), _bury];
    };

    [_ied] call FUNC(buryIED);
} forEach _objects;
