#include "script_component.hpp"
private _curatorSelected = curatorSelected select 0;
if (_curatorSelected findIf {typeOf _x in IEDD_CLASSES} > -1) then {
	private _zeusBombs = _curatorSelected select {typeOf _x in IEDD_CLASSES && !isNil {_x getVariable QEGVAR(ied,bomb)}};
	{
		private _bomb = _x;
        [QEGVAR(ied,explosion), [_bomb]] call CBA_fnc_serverEvent;
	} forEach _zeusBombs;
};
