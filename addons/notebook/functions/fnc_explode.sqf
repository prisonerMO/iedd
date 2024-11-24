#include "script_component.hpp"
private _curatorSelected = curatorSelected select 0;
if (_curatorSelected findIf {typeOf _x in IEDD_CLASSES} > -1) then {
	private _zeusBombs = _curatorSelected select {typeOf _x in IEDD_CLASSES};
	{
		private _bomb = _x;
         if !(_bomb getVariable [QEGVAR(ied,bomb),false]) then {
            _bomb setVariable [QEGVAR(ied,bomb), true, true];
         };
         _bomb setVariable [QEGVAR(ied,dud),0,true];
        [QEGVAR(ied,explosion), [_bomb]] call CBA_fnc_serverEvent;
	} forEach _zeusBombs;
};
