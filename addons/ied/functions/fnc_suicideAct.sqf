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
	[QGVAR(addRemovePFH), {[_unit,false]}] call CBA_fnc_localEvent;
	//setup movepoints  some how
	_unit call FUNC(suicide);
};

private _a = 40;
private _b = 40;
private _angle = 45;
private _next = 0;
private _prev = 0;

switch true do {
	case (_distance < DISTANCE_1) : {
		[QGVAR(addRemovePFH), {[_unit,true]}] call CBA_fnc_localEvent;
		_next = DISTANCE_0;
		_prev = DISTANCE_2;
		systemChat "under 50"
	};
	case (_distance < DISTANCE_2) : {
		_next = DISTANCE_1;
		_prev = DISTANCE_3;
		systemChat "under 100"};
	case (_distance < DISTANCE_3) : {
		_next = DISTANCE_2;
		_prev = DISTANCE_4;
		systemChat "under 150"};
	case (_distance < DISTANCE_4) : {
		_next = DISTANCE_3;
		_prev = DISTANCE_5;
		systemChat "under 200"};
	case (_distance < DISTANCE_5) : {
		_next = DISTANCE_4;
		_prev = DISTANCE_6;
		systemChat "under 300"};
	case (_distance < DISTANCE_6) :	{
		IEDDSETPARAMS(35,35,30,"CARELESS","RED","FULL","COLUMN",5)
		diag_log [_a,_b,_angle,_behaviour,_combat,_speed,_formation,_timeout];
		_next = DISTANCE_5;
		_prev = _actDist;
	};
	default { systemChat "Ei tÃ¤Ã¤ toimi silleen ku pitÃ¤s"};
};

private _targetPos = getPosATL _target;
private _pos = [[_targetPos, _a, _b, _angle, false]] call CBA_fnc_randPosArea; //position = [[[x,y,z], a, b, angle, isRectangle]]
if ((_pos isEqualTo []) || {isNull _group}) exitWith {ERROR_2("Bad Input [_pos: %1][_group: %2]",_pos,_group);};

private _args = [_group, _pos, _behaviour, _combat, _speed, _formation, _onComplete, _timeout];
private _act = [_unit, _target, _expDist, _actDist, _args]; diag_log (_act);
_group setVariable [QGVAR(suicideAct), _act];

private _statements = [QUOTE([ARR_1(((group this) getVariable QQGVAR(suicideAct)) call FUNC(suicideAct))])]; diag_log (_statements);
_statements pushBack _onComplete;
_onComplete = _statements joinString ";";

[_group] call CBA_fnc_clearWaypoints;
{
	_x enableAI "PATH";
} forEach units _group;

private _wp =
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
_unit setVariable [(suicideWp), _wp];

[_unit,_target,_wp,(_timeout*2),_next,_prev] call FUNC(moveCheck);



