#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if the curator selected object(s) type is kind of IED and can explode
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOLEAN>
 *
 * Example:
 * call iedd_notebook_fnc_canExplode
 *
 * Public: No
 */

TRACE_1("fnc_canExplode",_this);

(curatorSelected select 0) findIf {typeOf _x in IEDD_CLASSES} > -1
