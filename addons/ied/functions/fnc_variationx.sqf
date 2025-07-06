#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Generate random colors for wires (Varition X)
 *
 * Arguments:
 * 0: Count <NUMBER>
 *
 * Return Value:
 * [<ARRAY of STRING>, <ARRAY of NUMBER>]
 *
 * Example:
 * [5] call iedd_ied_fnc_variationx
 *
 * Public: No
 */

params ["_count"];
TRACE_1("fnc_variationx",_this);

private _colors = [];
for "_i" from 0 to _count do {
    private _color = if (_i > 4) then {
        selectRandom ["Red","Green","Yellow","Blue"];
    } else {
        selectRandom ["Red","Green","Yellow","Black","Blue"];
    };
    _colors pushBack _color;
};
_order = [];
_order resize _count+1;
_final = _order apply {0};
[_colors,_final];
