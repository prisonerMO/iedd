#include "script_component.hpp"
params ["_unit","_state"];
private _expDist = _unit getVariable QGVAR(expDist);
if (isNil "_expDist") then {
	private _getExp = _unit getVariable [QGVAR(explosionDist), 0];
	_expDist = if (_getExp > 0) then {_getExp} else {[GVAR(expMinRange), GVAR(expMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(expDist), _expDist];
};
private _target = _unit getVariable [QGVAR(target),objNull];
_actPfhID = [{
	params ["_args","_pfhID"];
	_args params ["_unit","_target","_expDist"];
	if (!alive _target) exitWith {
		_unit setVariable [QGVAR(target),objNull];
		_unit setVariable [QGVAR(actPFHID),-1];
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
	TRACE_1("suicideAct PFEH:",_this)
}, 0.5, [_unit, _target, _expDist]] call CBA_fnc_addPerFrameHandler;
_unit setVariable [QGVAR(actPFHID),_actPFHID];