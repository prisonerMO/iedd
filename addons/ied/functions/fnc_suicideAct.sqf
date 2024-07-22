#include "script_component.hpp"
params ["_unit","_targetUnits","_expDist","_actDist",["_args",[]]];
_args params [
	["_group", objNull, [objNull,grpNull]],
    ["_pos", [0, 0, 0], []],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_onComplete", "", [""]],
    ["_timeout", [0, 0, 0], [[]], 3]
];
diag_log format ["suicideAct: %1",_this];
diag_log format ["Param [1]: %1", param [1]];
private _group = _unit call CBA_fnc_getGroup; // use group or unit?
if !(local _group) exitWith {};

private _target = if (_targetUnits isEqualType []) then
	{
		selectRandom _targetUnits;
	} else {
		_targetUnits;
	};

private _distance = _unit distance _target;
if (_actDist * 1.5 < _distance) exitWith {
	private _actPfhID = _unit getVariable [QGVAR(actPfhID),-1];
	if (_actPfhID > -1) then {
		[_actPfhID] call CBA_fnc_removePerFrameHandler;
	};
	_unit call FUNC(suicide);
};

if (_args isEqualTo []) then {
	private _actPfhID =
	[{
		params ["_args", "_pfhID"];
		_args params ["_unit","_target","_expDist"];
		if (!alive _target) then {
			_grp = group _target select {alive _x};
			_target = if (_grp isNotEqualTo []) then {
				selectRandom _grp;
			} else {
				objNull;
			};
		};
		if (isNull _target) exitWith {
			[_pfhID] call CBA_fnc_removePerFrameHandler;
		};
		if (_unit distance _target < _expDist) exitWith { //EXP Dist reached then Explosion
			[_pfhID] call CBA_fnc_removePerFrameHandler;
			private _attachedObjects = attachedObjects _unit;
			private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
			if (_index > -1) then {
				private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
				{
					private _charge = _x;
					private _isBomb = _charge getVariable [QGVAR(bomb),false];
					TRACE_1("is Bomb",_isBomb);
					if (_isBomb) then {
						[QGVAR(explosion), [_charge]] call CBA_fnc_serverEvent;
					};
				} forEach _charges;
			};
		};
		diag_log format ["suicideAct PFEH: %1",_this];
	}, 1, [_unit, _target, _expDist]] call CBA_fnc_addPerFrameHandler;
	_unit setVariable [QGVAR(actPfhID),_actPfhID];
};
//some motha fucking waypoint shit
private _targetPos = getPosATL _target;
private _pos = [[_targetPos, 30, 30, 45, false]] call CBA_fnc_randPosArea; //position = [[[x,y,z], a, b, angle, isRectangle]]
private _args = [_group, _pos, _behaviour, _combat, _speed, _formation, _onComplete, _timeout];
private _act = [_unit, _target, _expDist, _actDist, _args];
diag_log (_args);

[_group] call CBA_fnc_clearWaypoints;
{
	_x enableAI "PATH";
} forEach units _group;
_group setVariable [QGVAR(suicideAct), _act];

if ((_pos isEqualTo []) || {isNull _group}) exitWith {ERROR_2("Bad Input [_pos: %1][_group: %2]",_pos,_group);};

private _statements = [QUOTE([ARR_1(((group this) getVariable QQGVAR(suicideAct)) call FUNC(suicideAct))])];
diag_log (_statements);

/* IF needed more stuff to _onComplete action
	_statements append [
 		"deleteWaypoint [group this, currentWaypoint (group this)]",
        "[group this] call CBA_fnc_searchNearby"
	];*/
/*
_behaviour =
	switch (_distance) do {
	case < 100: {systemChat "habla"};

};
_combat = switch (_distance) do {
	case < 100: {systemChat "habla"};
_speed = switch (_distance) do {
	case < 100: {systemChat "habla"};
_formation = switch (_distance) do {
	case < 100: {systemChat "habla"};

switch (_distance) do {
	_behaviour =
    _combat =
    _speed =
    _formation =
}
*/
// Inject the statement in this order to ensure valid syntax
_statements pushBack _onComplete;
_onComplete = _statements joinString ";";

diag_log format ["_onCompelete %1", _onComplete];

[
    _group,
    _pos,
    -1,
    "MOVE",
    _behaviour,
    _combat,
    _speed,
    _formation,
    _onComplete,
    _timeout,
    5
] call CBA_fnc_addWaypoint;



