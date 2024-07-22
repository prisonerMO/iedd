#include "script_component.hpp"
params ["_unit","_status"];
if (!local _unit) exitWith {};
private _attachedObjects = attachedObjects _unit;
private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
if (_index > -1) then {
	TRACE_1("Handle Unconscious",_this);
	// No need to kill / remove IEDS
	/* NOT IN USE CURRENLTY
	if (_status) then {
		//if true --> Unco -> DO stuff
	} else {
		//if false -> Woke up -> DO stuff
	};
	*/
};