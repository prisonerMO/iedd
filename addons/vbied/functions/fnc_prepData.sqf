#include "..\script_component.hpp"
params ["_vehicle","_activated"];
TRACE_1("VBIED prep data",_this);
if (is3DEN) exitWith {};
if (!_activated) exitWith {TRACE_1("ExitWith _actived:",_activated)};
if (!isServer) exitWith {TRACE_1("ExitWith isServer:",isServer)};
[{
	!isNull (_this select 0)
},
{
    params ["_vehicle"];
    private _variation = _vehicle getVariable [QGVAR(variation),GVAR(defaultVariation)];
    if (_variation == 5) then {
		_variation = selectRandom [0,1,2,3,4];
	};
	private _pos = _vehicle getVariable [QGVAR(pos),[0,0,0]];
	private _dir = _vehicle getVariable [QGVAR(dir),[0,0,0]];
	private _up = _vehicle getVariable [QGVAR(up),[0,0,0]];
	private _dud = _vehicle getVariable [QGVAR(dud),GVAR(defaultDud)];
	private _size = _vehicle getVariable [QGVAR(size),GVAR(defaultSize)];
	private _timerValue = _vehicle getVariable [QGVAR(timer), GVAR(defaultTimer)];
    private _isTimer = if (_timerValue > 1) then {selectRandom [false,true]} else {[false,true] select _timerValue};
    private _timerTime = round (_vehicle getVariable  [QGVAR(timerValue),GVAR(defaultTimerValue)]);
    private _randomValue = _vehicle getVariable [QGVAR(randomTimer), GVAR(defaultRandomTimer)];
    private _isRandom = if (_randomValue > 1) then {selectRandom [false,true]} else {[false,true] select _randomValue};
	private _isDistance = _vehicle getVariable [QGVAR(distance), 0];
	private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    private _getIn = _vehicle getVariable [QGVAR(getIn),GVAR(defaultGetIn)];    
	private _isGetIn = if (_getIn > 1) then {selectRandom [false,true]} else {[false,true] select _getIn};
    private _engineOn = _vehicle getVariable [QGVAR(engineOn),GVAR(defaultEngineOn)];    
	private _isEngineOn = if (_engineOn > 1) then {selectRandom [false,true]} else {[false,true] select _engineOn};
	private _move = _vehicle getVariable [QGVAR(moving),GVAR(defaultMoving)];
    private _isMove = if (_move > 1) then {selectRandom [false,true]} else {[false,true] select _move};
    private _speed = _vehicle getVariable [QGVAR(speed),GVAR(defaultSpeed)];
    [_vehicle,_variation,_pos,_dir,_up,_dud,_size,_isTimer,_timerTime,_isRandom,_distance,_isGetIn,_isEngineOn,_isMove,_speed] call FUNC(setVbied);
},[_vehicle]] call CBA_fnc_waitUntilAndExecute;
//OR --> [_vehicle], 0.1] call CBA_fnc_waitAndExecute;
true;