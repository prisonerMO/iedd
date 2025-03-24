#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Returns the default model for the given vehicle.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 *
 * Return Value:
 * Array of returns <ARRAY>
 * 0: Index <NUMBER>
 * 1: Type of model <STRING>
 * 2: Name of model <STRING>
 *
 * Example:
 * [_vehicle] call iedd_vbied_fnc_modelDefault;
 *
 * Public: No
 */

params ["_vehicle"];
TRACE_1("fnc_modelDefault",_this);

private _model = getModelInfo _vehicle select 0;
private _index = VBIED_MODELS findIf {_model in _x};
private _type = typeOf _vehicle;
[_index,_model,_type]