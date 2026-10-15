#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Explode the curator selected IEDs
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_zeus_fnc_explode
 *
 * Public: No
 */

TRACE_1("fnc_explode",_this);

private _curatorSelected = curatorSelected select 0;
private _zeusBombs = _curatorSelected select {typeOf _x in IEDD_CLASSES};
{
    private _bomb = _x;
  [QEGVAR(modules,explode), [_bomb]] call CBA_fnc_serverEvent;
} forEach _zeusBombs;

