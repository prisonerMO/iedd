#include "script_component.hpp"
params ["_unit"];
private _actDist = _unit getVariable QGVAR(actDist);
if (isNil "_actDist") then {
	private _getAct = _unit getVariable [QGVAR(actDist),0];
	_actDist = if (_getAct> 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(actDist), _actDist,true];
};
private _hideOnStart = _unit getVariable [QGVAR(hideOnStart),false];
private _isHide = _unit getVariable [QGVAR(hide),false];
if (_hideOnStart && !_isHide) then {
	[_unit,true] call FUNC(hideCharges);
	_unit setVariable [QGVAR(hide),true];
};
private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
	_unit removeEventHandler ["Killed", _killedEhId];
	_unit setVariable [QGVAR(KilledEhId),-1,true];
};
TRACE_2("Distance, Hide",_actDist,_hideOnStart);
[{
    params ["_args", "_pfhID"];
    _args params ["_unit","_actDist"];
	private _players = call BIS_fnc_listPlayers select {alive _x && !(objectParent _x isKindOf "Air")};
	private _nearPlrs = _players select {;;(_unit distance _x) < _actDist};
    if (_nearPlrs isNotEqualTo []) exitWith { //actDist reached then call move stuff
		private _isHide = _unit getVariable [QGVAR(hide),false];
		if (_isHide) then {
			[_unit,false] call FUNC(hideCharges);
		};
		private _target = selectRandom _nearPlrs;
		private _targetSide = side _target;
		_unit setVariable [QGVAR(targetSide),_targetSide];
		private _isDeadManSwitch = _unit getVariable QGVAR(isDeadManSwitch);
		if (isNil "_isDeadManSwitch") then {
			_isDeadManSwitch = _unit getVariable [QGVAR(isDeadManSwitch),false];
			_unit setVariable [QGVAR(isDeadManSwitch),_isDeadManSwitch];
		};
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
		[_unit,_target,_actDist] call FUNC(suicideAct);
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
}, 5, [_unit,_actDist]] call CBA_fnc_addPerFrameHandler;

