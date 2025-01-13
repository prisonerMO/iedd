#include "script_component.hpp"
params ["_target", "_player", "_params"];
private _isBomb = _target getVariable [QGVAR(bomb), false];
diag_log format["IED: Closing bucket %1, is Bomb: %2", _target, _isBomb];
_target animate ["bucketlid_hide", 0];