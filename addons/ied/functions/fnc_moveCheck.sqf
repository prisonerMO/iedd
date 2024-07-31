#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev"];
private _currentWp = _unit getVariable [QGVAR(suicideWP),nil];
if (isNil "_currentWp") exitWith{};
private _currentTarget = _unit getVariable [QGVAR(target), objNull];
private _args = ((group _unit) getVariable QGVAR(suicideAct));
if (_target != _currentTarget) exitWith {
	TRACE_1("Current Target",_currentTarget);
	_args call FUNC(suicideAct);
};
private _distance = _unit distance _target;
if ((_wp select 1) == (_currentWp select 1) && _next > 0) then {
	TRACE_3("WP,Current,Next",_wp select 1,_currentWp select 1,_next);
	if (_distance < _next || _distance > _prev) then {
		_args call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};
