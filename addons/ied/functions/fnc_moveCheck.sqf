#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev","_loseDist"];
private _currentWp = _unit getVariable [QGVAR(suicideWP), [-1,-1]] select 1;
if (isNil "_currentWp") exitWith{};
if (_wp == _currentWp && _next > 0) then {
	if (_distance < _next || _distance > _prev) then {
		private _args = ((group _unit) getVariable QGVAR(suicideAct));
		_args call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};
