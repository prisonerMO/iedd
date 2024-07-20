#include "script_component.hpp"
params ["_unit"];
private _expDist = _unit getVariable QGVAR(expDist);
if (isNil "_expDist") then {
	private _getExp = _unit getVariable [QGVAR(explosive), 0];
	private _expDist= if (_getExp > 0) then {_getExp} else {[GVAR(expMinRange), GVAR(expMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(expDist),_explosive];
};
private _actDist = _unit getVariable QGVAR(actDist);
if (isNil "_actDist") then {
	private _getAct = _unit getVariable [QGVAR(activate),0];
	private _actDist= if (_getAct> 0) then {_getAct} else {[GVAR(actMinRange), GVAR(actMaxRange)] call BIS_fnc_randomInt};
	_unit setVariable [QGVAR(actDist),_activate];
};
private _isDeadManSwitch = _unit getVariable GVAR(deadManSwitch);
if (isNil "_isDeadManSwitch") then {
	private _isDeadManSwitch = _unit getVariable [QGVAR(isDeadManSwitch),false];
	_unit setVariable [QGVAR(deadManSwitch),_isDeadManSwitch];
	if (_isDeadManSwitch) then {
		[QGVAR(addLocal), [_unit], _unit] call CBA_fnc_targetEvent;
		//if locality change add event on new machine
		_unit addEventHandler ["Local", {
			params ["_entity","_isLocal"];
			if (_isLocal) then {
				[QGVAR(addLocal), [_entity], _entity] call CBA_fnc_targetEvent;
			} else {
				private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
				if (_killedEhId != -1) then {
					_unit removeEventHandler ["Killed", _killedEhId];
				};
			};
		}];
	};
};
diag_log format ["activate: %1, explosion: %2, isDeadManSwitch: %3",_activate, _explosive, _isDeadManSwitch];
[{
    params ["_args", "_pfhID"];
    _args params ["_unit","_expDist","_actDist","_isDeadManSwitch"];
	private _players = call BIS_fnc_listPlayers select {alive _x};
	private _nearPlrs = _players select {;;(_object distance _x) < _actDist};
    if (_nearPlrs isNotEqualTo []) exitWith { //actDist reached then call move stuff
		[_unit,_nearPlrs,_expDist,_actDist] call FUNC(suicideAct);
        [_pfhID] call CBA_fnc_removePerFrameHandler;
    };
    diag_log _this;
}, 5, [_unit,_expDist,_actDist]] call CBA_fnc_addPerFrameHandler;

