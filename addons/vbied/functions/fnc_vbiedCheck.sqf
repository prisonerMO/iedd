#include "../script_component.hpp"
//TRACE_1("VbiedCheck",_this);
private _checkTime = 5;
if (GVAR(bombs) isNotEqualTo []) then {
	private _players = call CBA_fnc_players;
	private _objectsToRemove = [];
	{
		private _object = _x;
		if (isNull _object || !(_object getVariable [QEGVAR(ied,bomb),false])) exitWith {
			_objectsToRemove pushBack _object;
		};
		private _distance = _object getVariable [QGVAR(dist),10];
		private _move = _object getVariable [QGVAR(move),false];
		private _veh = attachedTo _object;
		TRACE_3("VBIED",_distance,_move,_veh);
		if (_move) then {
			private _speed = _object getVariable [QGVAR(speed),GVAR(defaultSpeed)];
			if (speed _veh > _speed) then {
				TRACE_1("Vbied Speed",_speed);
				[QEGVAR(ied,explosion), [_object]] call CBA_fnc_serverEvent;
				_objectsToRemove pushBack _object;
				continue;
			};
		};
		if (GVAR(plrCheck)) then {
			private _nearPlrs = _players select {;;(_object distance _x) < _distance && {!(_x in _veh)}};
			if (_nearPlrs isNotEqualTo []) then {
				{
					_nearPlr = _x;
					if (speed _nearPlr > 8) then
					{
						TRACE_2("Vbied plr",_nearPlr,speed _nearPlr);
						[QEGVAR(ied,explosion), [_object]] call CBA_fnc_serverEvent;
						_objectsToRemove pushBack _object;
						continue;
					};
				} forEach _nearPlrs;
			};
		};
		if (GVAR(vehCheck)) then {
			private _nearVehicles = (_object nearEntities [["Car", "Motorcycle", "Tank"], _distance]);
			if ((_nearVehicles-[_veh]) isNotEqualTo []) then {
				private _index = _nearVehicles findIf {((crew _x) findIf {isPlayer _x} > -1) && {(speed _x > 8 || speed _x < -8)}};
				if (_index > -1) then {
					TRACE_2("Vbied veh",_nearVehicles select _index,speed (_nearVehicles select _index));
					[QEGVAR(ied,explosion), [_object]] call CBA_fnc_serverEvent;
					_objectsToRemove pushBack _object;
					continue;
				};
			};
		};
	} forEach GVAR(bombs);
	GVAR(bombs) = GVAR(bombs) - _objectsToRemove;
	_checkTime = 0.5;
};
TRACE_3("Current objects",count GVAR(bombs),time,_checkTime);
[FUNC(vbiedCheck), [], _checkTime] call CBA_fnc_waitAndExecute;


