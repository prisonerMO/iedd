#include "script_component.hpp"
params ["_target", "_state"];
private _isBomb = _target getVariable [QGVAR(bomb), false];
diag_log format["IED: Open/close bucket %1, is Bomb: %2 , state: %3", _target, _isBomb,_state];
_target animate ["bucketlid_hide", _state];