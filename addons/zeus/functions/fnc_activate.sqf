#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Activate selected IED via ACE Zeus Actions
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_zeus_fnc_activate
 *
 * Public: No
 */

TRACE_1("fnc_activate",_this);

private _curatorSelected = curatorSelected select 0;
private _zeusBombs = _curatorSelected select {typeOf _x in IEDD_CLASSES && _x getVariable [QEGVAR(ied,bomb),false]};
{
    private _bomb = _x;
    [QEGVAR(ied,explosion), [_bomb]] call CBA_fnc_serverEvent;
} forEach _zeusBombs;

