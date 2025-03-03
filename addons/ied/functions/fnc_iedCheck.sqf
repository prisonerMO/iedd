#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if IEDs are triggered by players or vehicles. Or if they are moved/ moving.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_ied_fnc_iedCheck
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
		TRACE_2("Object distance",_object,_distance);
		private _var = _object getVariable [QGVAR(movable),false];
		if (!_var) then {
			if (speed _object > 5 || !isNull attachedTo _object) then {
				_object call FUNC(bomb);
				_objectsToRemove pushBack _object;
				continue;
			};
		} else {
			private _veh = attachedTo _object;
			private _vehSpeed = speed _vehicle;
			(_vehSpeed > 45|| _vehSpeed < -45)  then {
				_object call FUNC(bomb);
				_objectsToRemove pushBack _object;
				continue;
			};
		};
		if (GVAR(plrCheck)) then {
			private _nearPlrs = _players select {;;(_object distance _x) < _distance};
			if (_nearPlrs isNotEqualTo []) then {
				{
					_nearPlr = _x;
					if (speed _nearPlr > 8) then
					{
						_object call FUNC(bomb);
						_objectsToRemove pushBack _object;
						continue;
					};
				} forEach _nearPlrs;
			};
		};
		if (GVAR(vehCheck)) then {
			private _nearVehicles = (_object nearEntities [["Car", "Motorcycle", "Tank"], _distance]);
			if (_nearVehicles isNotEqualTo []) then {
				private _index = _nearVehicles findIf {((crew _x) findIf {isPlayer _x} > -1) && {(speed _x > 8 || speed _x < -8)}};
				if (_index > -1) then {
					_object call FUNC(bomb);
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
[FUNC(iedCheck), [], _checkTime] call CBA_fnc_waitAndExecute;


