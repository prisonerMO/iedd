//#define DEBUG_ENABLED_IED
#include "script_component.hpp"
params ["_unit"];
private _actDist = _unit getVariable QGVAR(actDist);
if (isNil "_actDist") then {
	private _getAct = _unit getVariable [QGVAR(actDist),0];
	_actDist = if (_getAct > 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
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
TRACE_3("Suicide:",_unit,_actDist,_hideOnStart);
private _side = _unit getVariable QGVAR(suicideSide);
private _actSides = _unit getVariable [QGVAR(sides),[-1]];
private _sides = [];
if (_actSides findIf {_x > -1} != -1) then {
	{
		//private _dump = [];2.18
		if (_x > -1) then {
			_sides pushBackUnique (_x call BIS_fnc_sideType);
			//_dump pushBack _forEachIndex;
		};
	} forEach _actSides;
	//_sides deleteAt _dump;2.18
} else {
	_sides = [east,west,resistance,civilian] - [_side];
};
[{
	[{
		params ["_args", "_pfhID"];
		_args params ["_unit","_sides","_actDist"];
		private _getPlayers = call CBA_fnc_players select {
			alive _x && {
				side group _x in _sides && {
					!(objectParent _x isKindOf "Air")
				}
			}
		};
		private _players = if (GVAR(includeZeus)) then {
			_getPlayers; //will include all players + zeus
		} else {
			_getPlayers select {isNull getAssignedCuratorLogic _x}; // will exclude zeus from players
		};
		TRACE_3("actPFH",_unit,_players,_actDist);
		private _nearPlrs = _players select {;;(_unit distance _x) < _actDist};
		/*private _isRemote = _nearPlrs select {isRemoteControlling _x && {side group (remoteControlled _x) == _side}};
		TO-DO get zeus excluded if remote controlling and "own" side in _sides,	maybe will taken to use, maybe not*/
		if (_nearPlrs isNotEqualTo []) exitWith { // actDist reached then call move stuff
			private _isHide = _unit getVariable [QGVAR(hide),false];
			if (_isHide) then {
				[_unit,false] call FUNC(hideCharges);
			};
			private _target = selectRandom _nearPlrs;
			private _targetSide = side group _target;
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
			TRACE_5("Exit PFH",_unit,_target,_targetSide,_actDist,_isDeadManSwitch);
		};
	}, 5, [_unit,_sides,_actDist]] call CBA_fnc_addPerFrameHandler;
},[_unit,_sides,_actDist],0.5] call CBA_fnc_waitAndExecute;