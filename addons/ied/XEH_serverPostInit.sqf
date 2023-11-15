/* NOT IN USE 
#include "script_component.hpp"

{
	[_x, "Deleted", {(_this select 0) call FUNC(deleted)}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach IEDD_CLASSES;

GVAR(bombs) = [];
[{time > 10 && !isNil QGVAR(bombs)},		
	{
		INFO_1("Detect event called [Time: %1]",time);
		[0.1] spawn {
			params ["_checkPeriod"];
			while {true} do
			{
				if (GVAR(bombs) isNotEqualTo []) then {				

					private _players = call BIS_fnc_listPlayers;
					private _objectsToRemove = [];
					{
						private _object = _x;
						if (isNil {_object getVariable QGVAR(bomb)}) exitWith {
							_objectsToRemove pushBack _object;
						};
						private _distance = _object getVariable [QGVAR(dist),10];
						private _var = _object getVariable [QGVAR(movable),false];
						if (!_var) then {   
							if (speed _object > 5 || !isNull attachedTo _object) then {
								[QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
								_objectsToRemove pushBack _object;
							};
						} else {
							if (speed (attachedTo _object) > 45) then {
								[QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
								_objectsToRemove pushBack _object;
							};
						};
						if (GVAR(plrCheck)) then {
							private _nearPlrs = _players select {;;(_object distance _x) < _distance};					
							if (_nearPlrs isNotEqualTo []) then {
								{
									_nearPlr = _x;
									if (speed _nearPlr > 8) then
									{
										[QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
										_objectsToRemove pushBack _object;
									};
								} forEach _nearPlrs;
							};
						};
						if (GVAR(vehCheck)) then {
							private _nearVehicles = (_object nearEntities [["Car", "Motorcycle", "Tank"], _distance]);
							if (_nearVehicles isNotEqualTo []) then {
								private _index = _nearVehicles findIf {((crew _x) findIf {isPlayer _x} != -1) && {(speed _x > 8 || speed _x < -8)}};
								if (_index > -1) then {
									[QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
									_objectsToRemove pushBack _object;
								};
							};
						};
					} forEach GVAR(bombs);
					GVAR(bombs) = GVAR(bombs) - _objectsToRemove;
					sleep _checkPeriod;
				} else {
					sleep 1;
				};
			};
		};
	},
	[], 
	15, 
	{}
] call CBA_fnc_waitUntilAndExecute;*/






