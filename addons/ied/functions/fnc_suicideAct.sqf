#include "script_component.hpp"
params ["_unit","_nearPlrs","_expDist","_actDist",["_args",[]]];
_args params [
	["_group", objNull, [objNull,grpNull]],
    ["_area", "", ["",objNull, locationNull,[]], 5],
    ["_behaviour", "UNCHANGED", [""]],
    ["_combat", "NO CHANGE", [""]],
    ["_speed", "UNCHANGED", [""]],
    ["_formation", "NO CHANGE", [""]],
    ["_onComplete", "", [""]],
    ["_timeout", [0, 0, 0], [[]], 3]
];
diag_log format ["suicideAct: %1",_this];
_targetPlayer = selectRandom _nearPlrs;
_distance = _unit distance _targetPlayer;
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
		_args params ["_unit","_targetPlayer","_expDist"];
		private _target = if (!alive _targetPlayer) then {
			_grp = group _targetPlayer select {alive _x};
			if (_grp isNotEqualTo []) then {
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
			private _charges = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
			if (_charges == -1) exitWith {};
			{
				private _charge = _x;
				private _isBomb = _charge getVariable [QGVAR(bomb),false];
				TRACE_1("is Bomb",_isBomb);
				if (_isBomb) then {
					[QGVAR(explosion), [_charge]] call CBA_fnc_serverEvent;
				};
			} forEach _charges;
		};
		diag_log _this;
	}, 1, [_unit, _targetPlayer, _expDist]] call CBA_fnc_addPerFrameHandler;
	_unit setVariable [QGVAR(actPfhID),_actPfhID];
};
//some motha fucking waypoint shit


