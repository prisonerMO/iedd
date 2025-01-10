#include "script_component.hpp"
params ["_ctrlCheckbox","_value"];
TRACE_1("IEDD: onSuicideLoad",_this);
_this spawn {	
params ["_ctrlCheckbox","_value"];
	sleep 0.5;
	disableSerialization;
	private _fade = [0,0.75] select _value;
	private _all = (allControls (ctrlParent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);
	private _controls = _all select {ctrlClassName _x find ["iedd_ied", 0] == 0};
	private _isCharge = _controls select {ctrlClassName _x == "iedd_ied_isCharge"};
	private _isChargeGroup = _isCharge select 0;
	private _isChargeCtrl = (allControls _isChargeGroup) select 1;
	private _isChargeChecked =  cbChecked _isChargeCtrl;	
	if !(_isChargeChecked) exitWith {};
	_ctrlCheckbox call FUNC(onSuicideChanged);
};