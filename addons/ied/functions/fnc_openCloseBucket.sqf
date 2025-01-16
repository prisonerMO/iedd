#include "script_component.hpp"
params ["_target", "_player", "_state"];
private _isBomb = _target getVariable [QGVAR(bomb), false];
diag_log format["IED: Open/close bucket %1, is Bomb: %2 , state: %3", _target, _isBomb,_state];
private _lid = _target getVariable [QGVAR(lid), 0];
private _expChance = _lid select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
diag_log format["IED: Open/close bucket %1, lid: %2, expChance: %3", _target, _lid, _expChance];
_target animate ["bucketlid_hide", _state];