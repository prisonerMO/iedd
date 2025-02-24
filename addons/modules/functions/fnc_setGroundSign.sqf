#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Intiliaze the "Place Ground Sign" Zeus module display
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [params] call PREFIX_modules_fnc_setGroundSign
 *
 * Public: No
 */

params ["_control"];
TRACE_1("fnc_setGroundSign",_this);

//Generic Init:
private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayCtrl 1; //IDC_OK
private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];

_control ctrlRemoveAllEventHandlers "SetFocus";

private _fnc_onUnload = {
    private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];
	private _logic = missionNamespace getVariable ["BIS_fnc_initCuratorAttributes_target",objNull];
	private _signPos = _logic modelToWorld [0,0,0];
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    private _typeCtrl = _display displayCtrl 52620;
    private _typeNum = lbCurSel _typeCtrl;
    private _type = _typeCtrl lbData _typeNum;
    [QEGVAR(ied,decals),[_signPos,_type]] call CBA_fnc_serverEvent;
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
