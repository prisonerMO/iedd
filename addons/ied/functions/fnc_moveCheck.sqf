#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev"];
private _currentWp = _unit getVariable [QGVAR(suicideWP),nil];
private _currentTarget = _unit getVariable [QGVAR(target), objNull];
private _target = unit getVariable [QGVAR(target),objNull];
if (isNil "_currentWp") exitWith{};
private _currentTarget = _unit getVariable [QGVAR(target), objNull];
private _target = unit getVariable [QGVAR(target),objNull];
if (_target != _currentTarget) exitWith {
	private _args = ((group _unit) getVariable QGVAR(suicideAct));
	_args call FUNC(suicideAct);
};
if (_wp == (_currentWp select 1) && _next > 0) then {
	if (_distance < _next || _distance > _prev) then {
		_args call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};
