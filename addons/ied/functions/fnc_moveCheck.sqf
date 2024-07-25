#include "script_component.hpp"
params ["_unit","_target","_wp","_time","_next","_prev","_loseDist"];
private _distance = _unit distance _target;
if (_loseDist < _distance) exitWith {
	[QGVAR(addRemovePFH), {[_unit,false]}] call CBA_fnc_localEvent;
	//setup movepoints  some how
	_unit call FUNC(suicide);
};
private _currentWp = unit getVariable [QGVAR(suicideWP), [-1,-1]] select 1;
if (_wp == _currentWp && _next > 0) then {
	if (_distance < _next || _distance > _prev) then {
		private _args = ((group _unit) getVariable QGVAR(suicideAct));
		_args call FUNC(suicideAct);
	} else {
		[{_this call FUNC(moveCheck)}, _this, _time] call CBA_fnc_waitAndExecute;
	};
};