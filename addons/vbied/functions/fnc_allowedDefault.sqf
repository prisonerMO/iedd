#include "..\script_component.hpp"
params ["_vehicle"];
diag_log format ["Vehicle %1", _vehicle];
private _type = getModelInfo _vehicle select 0;
diag_log format ["Type %1", _type];
private _index = VBIED_MODELS findIf {_type in _x};
_index > -1