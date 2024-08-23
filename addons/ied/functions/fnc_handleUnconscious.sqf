#include "script_component.hpp"
params ["_unit","_status"];
TRACE_1("Unconscius",_this);
diag_log ["UNCO",_this];
if (_status) then {
	private _attachedObjects = attachedObjects _unit;
    private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
    if (_index > -1) then {
		_unit setDamage 1;
	};
};
