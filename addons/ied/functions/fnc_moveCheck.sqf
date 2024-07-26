#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev"];
private _currentWp = _unit getVariable [QGVAR(suicideWP),nil];
if (isNil "_currentWp") exitWith{};
if (_wp == (_currentWp select 1) && _next > 0) then {
	if (_distance < _next || _distance > _prev) then {
		private _args = ((group _unit) getVariable QGVAR(suicideAct));
		_args call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};
