#include "..\script_component.hpp"
params ["_unit","_value","_aceType","_type"];
if (isServer && {is3DEN}) then {
    private _isChargeVest = (_unit get3DENAttribute QGVAR(isCharge)) select 0;
    if (_isChargeVest) then {
        private _aceStatus = (_unit get3DENAttribute _aceType) select 0;
        if (_value && {!_aceStatus}) then {
            _unit set3DENAttribute [_aceType, _value];
        };
        if (!_value && {_aceStatus}) then{
            _unit set3DENAttribute [_aceType, _value];
        };
    } else {
        _unit set3DENAttribute [_type, false];
    };
};