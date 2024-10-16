#include "..\script_component.hpp"
params ["_control"];
//Generic Init:
private _unit = attachedTo _logic;
private _message = "No unit selected";

if (isNull _unit) exitWith {
    deleteVehicle _logic;
    [ace_player, _message] call BIS_fnc_showCuratorFeedbackMessage;
};

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
	private _pos = _logic modelToWorld [0,0,0];
    private _display = ctrlParent _ctrlButtonOK;
    if (isNull _display) exitWith {};
    systemChat format ["%1, %2, %3",_this, _logic, _display];
};

_display displayAddEventHandler ["Unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["ButtonClick", _fnc_onConfirm];
