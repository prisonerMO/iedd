#include "script_component.hpp"
params ["_unit"];
private _actDist = _unit getVariable QGVAR(actDist);
if (isNil "_actDist") then {
	private _getAct = _unit getVariable [QGVAR(activationDist),0];
	_actDist = if (_getAct> 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(actDist), _actDist];
};
private _hideOnStart = _unit getVariable [QGVAR(hideOnStart),false];
if (_hideOnStart) then {
	[_unit,true] call FUNC(hideCharges);
	_unit setVariable [QGVAR(hide),true];
};
private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
	_unit removeEventHandler ["Killed", _killedEhId];
	_unit setVariable [QGVAR(KilledEhId),-1];
};
TRACE_2("Distance, Hide",_actDist,_hideOnStart);
[{
    params ["_args", "_pfhID"];
    _args params ["_unit","_actDist"];
	private _players = call BIS_fnc_listPlayers select {alive _x};
	private _nearPlrs = _players select {;;(_unit distance _x) < _actDist};
    if (_nearPlrs isNotEqualTo []) exitWith { //actDist reached then call move stuff
		private _isHide = _unit getVariable [QGVAR(hide),false];
		if (_isHide) then {
			[_unit,false] call FUNC(hideCharges);
		};
		[_unit,_nearPlrs,_actDist] call FUNC(suicideAct);
		private _isDeadManSwitch = _unit getVariable GVAR(isDMS);
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
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
}, 5, [_unit,_actDist]] call CBA_fnc_addPerFrameHandler;

