#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles position on attribute save event.
 *
 * Arguments:
 * 0: Control <CONTROL>
 *
 * Return Value:
 * Set current selection of the control.
 *
 * Example:
 * [_control] call iedd_vbied_fnc_pos_onAttributeSave;
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_pos_onAttributeSave",_this);

private _ctrlCombo = _control controlsGroupCtrl 100;
lbCurSel _ctrlCombo

