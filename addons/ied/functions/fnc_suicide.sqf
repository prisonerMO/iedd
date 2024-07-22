#include "script_component.hpp"
params ["_unit"];
private _expDist = _unit getVariable QGVAR(expDist);
diag_log ["_expDist: %1, isNIl: %2", _expDist, isNil {unit getVariable QGVAR(expDist)}];
if (isNil "_expDist") then {
	private _getExp = _unit getVariable [QGVAR(explosionDist), 0];
	_expDist = if (_getExp > 0) then {_getExp} else {[GVAR(expMinRange), GVAR(expMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(expDist), _expDist];
};
private _actDist = _unit getVariable QGVAR(actDist);
diag_log ["_actDist: %1, isNIl: %2", _actDist, isNil {unit getVariable QGVAR(actDist)}];
if (isNil "_actDist") then {
	private _getAct = _unit getVariable [QGVAR(activationDist),0];
	_actDist = if (_getAct> 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(actDist), _actDist];
};
private _isDeadManSwitch = _unit getVariable GVAR(isDMS);
diag_log ["_isDMS: %1, isNIl: %2", _isDeadManSwitch , isNil {unit getVariable QGVAR(isDMS)}];
if (isNil "_isDeadManSwitch") then {
	_isDeadManSwitch = _unit getVariable [QGVAR(isDeadManSwitch),false];
	_unit setVariable [QGVAR(isDMS),_isDeadManSwitch];
	if (_isDeadManSwitch) then {
		[QGVAR(addLocal), [_unit], _unit] call CBA_fnc_targetEvent;
		//if locality change add event on new machine
		_unit addEventHandler ["Local", {
			params ["_entity","_isLocal"];
			if (_isLocal) then {
				[QGVAR(addLocal), [_entity], _entity] call CBA_fnc_targetEvent;
			} else {
				private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
				if (_killedEhId != -1) then {
					_unit removeEventHandler ["Killed", _killedEhId];
				};
			};
		}];
	};
};
diag_log format ["activate: %1, explosion: %2, isDeadManSwitch: %3",_actDist, _expDist, _isDeadManSwitch];
[{
    params ["_args", "_pfhID"];
    _args params ["_unit","_expDist","_actDist","_isDeadManSwitch"];
	private _players = call BIS_fnc_listPlayers select {alive _x};
	private _nearPlrs = _players select {;;(_unit distance _x) < _actDist};
    if (_nearPlrs isNotEqualTo []) exitWith { //actDist reached then call move stuff
		[_unit,_nearPlrs,_expDist,_actDist] call FUNC(suicideAct);
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
    diag_log _this;
}, 5, [_unit,_expDist,_actDist]] call CBA_fnc_addPerFrameHandler;

