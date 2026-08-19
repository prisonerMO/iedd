#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Confirm handler for the ZEN "Make Suicide Bomber" dialog.
 * Applies the chosen parameters to every matched unit via fnc_makeSuicideBomber.sqf.
 *
 * Arguments:
 * 0: Dialog return values <ARRAY>
 * 1: Objects <ARRAY> (passed through from fnc_zenOpenSuicideDialog.sqf)
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_values", "_objects"];
_values params ["_variation", "_size", "_dud", "_actDist", "_expDist", "_isDms", "_selectedSides"];

private _sides = [-1, -1, -1, -1];
{
    private _id = [_x] call BIS_fnc_sideID;
    _sides set [_id, _id];
} forEach _selectedSides;

{
    [_x, _variation, _dud, _size, _actDist, _expDist, _sides, _isDms] call FUNC(makeSuicideBomber);
} forEach _objects;
