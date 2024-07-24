#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev"];
private _currentWp = _unit getVariable [(suicideWp), -1];
if (_wp == _currentWp) then {
	private _distance = _unit distance _target;
	if (_distance < _next || _distance > _prev) then {
		private _args = ((group _unit) getVariable QGVAR(suicideAct));
		_unit call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};