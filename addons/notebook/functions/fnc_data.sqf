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
 * [1] call iedd_notebook_fnc_data;
 *
 * Public: No
 */
if (isNil QGVAR(data)) then {
    GVAR(data) = createHashMap
};

GVAR(data) set ["iedd_tab", NOTEBOOK_TABS select 0];
GVAR(data) set ["iedd_page", 0];

{
    GVAR(pages) set [_x, GET_MAX_IMAGES_COUNT(_x)];
} forEach NOTEBOOK_TABS;

TRACE_1("fnc_data",GVAR(data));
