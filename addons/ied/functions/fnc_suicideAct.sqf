#include "script_component.hpp"
/*
 * Author: Prisoner
 * Handles suicide unit actions
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 * 2: Distance <NUMBER>
 * 3: Arguments <ARRAY> (Optinal)
 *
 * Return Value:
 * True
 *
 * Example:
 * [bob, player, 250] call iedd_ied_fnc_suicideAct
 *
 * Public: No
 */

params ["_unit","_target","_actDist",["_args",[]]];
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
TRACE_1("fnc_suicideAct",_this);

if (!local _unit) exitWith {
    [QGVAR(suicideAct), _this, _unit] call CBA_fnc_targetEvent; //if locality change?
};
if (!alive _unit) then {
    [group _unit] call CBA_fnc_clearWaypoints;
};
if (!alive _target) then {
    private _targetSide = _unit getVariable [QGVAR(targetSide),sideEmpty];
    private _units = _unit nearEntities ["CaManBase", _actDist/2] select {alive _x && side _x == _targetSide && !(objectParent _x isKindOf "Air")};
    _target = if (_units isNotEqualTo []) then {
        selectRandom _units;
    } else {
        objNull;
    };
};
TRACE_1("Target",_target);
_unit setVariable [QGVAR(target),_target];
private _distance = _unit distance _target;
private _loseDist = _actDist * 1.5;
private _actPFHID = _unit getVariable [QGVAR(actPFHID),-1];
private _group = _unit call CBA_fnc_getGroup; // use group or unit?

if (_loseDist < _distance || isNull _target) exitWith {
    if (_actPFHID > -1) then {
        [_actPFHID] call CBA_fnc_removePerFrameHandler;
    };
    //setup movepoints  some how
    [_group] call CBA_fnc_clearWaypoints;
    _unit enableAI "PATH";
    [_group, _group, 250, 5, "MOVE", "AWARE", "GREEN", "LIMITED", "STAG COLUMN","", [5, 6, 7]] call CBA_fnc_taskPatrol;
    _unit setVariable [QGVAR(suicideWP), nil,true];
    _unit call FUNC(suicide);
};

private _a = 50;
private _b = 50;
private _angle = 90;
private _next = 0;
private _prev = 0;

switch true do {
    case (_distance < DISTANCE_1) : {
        if (_actPFHID == -1) then {
            [QGVAR(addPFH), [_unit], _unit] call CBA_fnc_targetEvent;
        };
        _a = DISTANCE_0;
        _b = DISTANCE_0;
        IEDDSETPARAMS(_a,_b,0,"CARELESS","GREEN","FULL","VEE",1)
        _next = DISTANCE_0;
        _prev = DISTANCE_2;
    };
    case (_distance < DISTANCE_2) : {
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_2/10;
        _b = DISTANCE_2/10;
        IEDDSETPARAMS(_a,_b,10,"CARELESS","GREEN","FULL","VEE",2)
        _next = DISTANCE_1;
        _prev = DISTANCE_3;
    };
    case (_distance < DISTANCE_3) : {
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_3/10;
        _b = DISTANCE_3/10;
        IEDDSETPARAMS(_a,_b,15,"CARELESS","GREEN","FULL","DIAMOND",3)
        _next = DISTANCE_2;
        _prev = DISTANCE_4;
    };
    case (_distance < DISTANCE_4) : {
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_4/10;
        _b = DISTANCE_4/10;
        IEDDSETPARAMS(_a,_b,25,"CARELESS","GREEN","FULL","DIAMOND",4)
        _next = DISTANCE_3;
        _prev = DISTANCE_5;
    };
    case (_distance < DISTANCE_5) : {
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_5/10;
        _b = DISTANCE_5/10;
        IEDDSETPARAMS(_a,_b,30,"CARELESS","GREEN","NORMAL","COLUMN",5)
        _next = DISTANCE_4;
        _prev = DISTANCE_6;
    };
    case (_distance < DISTANCE_6) :	{
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_6/10;
        _b = DISTANCE_6/10;
        IEDDSETPARAMS(_a,_b,45,"CARELESS","GREEN","NORMAL","COLUMN",6)
        _next = DISTANCE_5;
        _prev = _actDist;
    };
    default {
        if (_actPFHID > -1) then {
            [_actPFHID] call CBA_fnc_removePerFrameHandler;
        };
        _a = DISTANCE_6/7;
        _b = DISTANCE_6/7;
        IEDDSETPARAMS(_a,_b,50,"CARELESS","GREEN","NORMAL","COLUMN",6)
        _next = DISTANCE_6;
        _prev = _actDist;
    };
};

private _targetPos = getPosATL _target;
private _pos = [[_targetPos, _a, _b, _angle, false]] call CBA_fnc_randPosArea; //position = [[[x,y,z], a, b, angle, isRectangle]]
if ((_pos isEqualTo []) || {isNull _group}) exitWith {ERROR_2("Bad Input [_pos: %1][_group: %2]",_pos,_group);};

private _args = [_group, _pos, _behaviour, _combat, _speed, _formation, _onComplete, _timeout];
private _act = [_unit, _target, _actDist, _args];
TRACE_1("_act",_act);
_group setVariable [QGVAR(suicideAct), _act,true];

private _statements = [QUOTE([ARR_1(((group this) getVariable QQGVAR(suicideAct)) call FUNC(suicideAct))])];
_statements pushBack _onComplete;
_onComplete = _statements joinString ";";

[_group] call CBA_fnc_clearWaypoints;
_unit enableAI "PATH";

private _wp = [
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
_unit setVariable [QGVAR(suicideWP), _wp];

[_unit,_target,_wp,5,_next,_prev] call FUNC(moveCheck);
true



