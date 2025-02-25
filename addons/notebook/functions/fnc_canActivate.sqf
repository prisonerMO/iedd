#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if the curator selected object(s) type is kind of IED and can be activated
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOLEAN>
 *
 * Example:
 * call iedd_notebook_fnc_canActivate
 *
 * Public: No
 */

TRACE_1("fnc_canActivate",_this);

(curatorSelected select 0) findIf {typeOf _x in IEDD_CLASSES &&
_x getVariable [QEGVAR(ied,bomb),false]} > -1
