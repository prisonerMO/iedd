#include "..\script_component.hpp"
params ["_vehicle"];
private _type = getModelInfo _vehicle select 0;
private _index = VBIED_MODELS findIf {_type in _x};
[_index,_type]