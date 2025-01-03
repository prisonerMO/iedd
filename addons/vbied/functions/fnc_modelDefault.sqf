#include "..\script_component.hpp"
params ["_vehicle"];
private _model = getModelInfo _vehicle select 0;
private _index = VBIED_MODELS findIf {_model in _x};
private _type = typeOf _vehicle;
[_index,_model,_type]