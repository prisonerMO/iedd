#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add model and values to the preDefined notebook_pages hashmap.
 *
 * Arguments:
 * 0: name <STRING>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * call iedd_notebook_fnc_pages;
 *
 * Public: No
 */
TRACE_1("fnc_pages",_this);
{
    systemChat format ["%1: %2", _x, GET_MAX_IMAGES_COUNT(_x)];
    private _key = _x;
    private _value = GET_MAX_IMAGES_COUNT(_key);
    GVAR(pages) set [_key, _value];
} forEach NOTEBOOK_PAGES; 
