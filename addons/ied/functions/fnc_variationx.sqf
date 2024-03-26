#include "script_component.hpp"
params ["_count"];
private _return = [];
private _colors = [];
for "_i" from 0 to _count do {
	private _color = if (_i > 4) then {
		selectRandom ["Red","Green","Yellow","Blue"];
	} else {
		selectRandom ["Red","Green","Yellow","Black","Blue"];
	};
	_colors pushBack _color;
};
_return pushBack _colors;
_return pushBack [0,0,0,0,0,0,0];
_return;