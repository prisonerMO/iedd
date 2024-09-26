#include "script_component.hpp"
params ["_ctrlGroup", "_value"];
private _states = [0,1,2,3];
if !(_value isEqualType []) then {
    _states set [_value,-1];
} else {
    _states = _value;
};
for '_i' from 100 to 103 do {
    if (_states param [_i - 100, -1] > -1) then {
        (_ctrlGroup controlsGroupCtrl _i) cbSetChecked true;
    };
};

