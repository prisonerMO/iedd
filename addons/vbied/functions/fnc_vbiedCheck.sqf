#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if VBIEDs are triggered by players or vehicles. Or if x vehicle is moving.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_vbied_fnc_vbiedCheck
 *
 * Public: No
 */
 
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
			private _vehSpeed = speed _vehicle;
			if (_vehSpeed > _speed || _vehSpeed < -_speed) then {
				TRACE_1("Vbied Speed",_speed);
				_object call EFUNC(ied,bomb);
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
						_object call EFUNC(ied,bomb);
						_objectsToRemove pushBack _object;
						continue;
					};
				} forEach _nearPlrs;
			};
		};
		if (GVAR(vehCheck)) then {
			private _nearVehicles = (_object nearEntities [["Car", "Motorcycle", "Tank"], _distance]);
			private _nearVehicles = _nearVehicles - [_veh];
			if ((_nearVehicles-[_veh]) isNotEqualTo []) then {
				private _index = _nearVehicles findIf {((crew _x) findIf {isPlayer _x} > -1) && {(speed _x > 8 || speed _x < -8)}};
				if (_index > -1) then {
					TRACE_2("Vbied veh",_nearVehicles select _index,speed (_nearVehicles select _index));
					_object call EFUNC(ied,bomb);
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