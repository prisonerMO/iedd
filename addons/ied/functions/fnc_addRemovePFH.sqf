#include "script_component.hpp"
params ["_unit","_state"];
private _actPFHID = unit getVariable [QGVAR(actPFHID),-1];
if (_state) then {
	_actPfhID = [{
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
	_unit setVariable [QGVAR(actPFHID),_actPFHID];
} else {
	if (_actPFHID > 0) then {
		[_pfhID] call CBA_fnc_removePerFrameHandler;
	};
};