#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles model on attribute load event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 * 1: Controlconfig entry <CONFIG>
 * 2: Value <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_control,_config,_value] call iedd_vbied_fnc_model_onAttributeLoad;
 *
 * Public: No
 */
 
params ["_control","_config","_value"];
TRACE_1("fnc_model_onAttributeLoad",_this);

GVAR(preDefined) set ["model",_value];
