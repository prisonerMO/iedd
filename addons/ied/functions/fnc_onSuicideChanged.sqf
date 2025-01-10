#include "script_component.hpp"
params ["_ctrlCheckbox"];
TRACE_1("Ctrl",_this);
private _state = [true,false] select (cbChecked _ctrlCheckbox);
private _fade = [0.75,0] select _state;
private _all = (allControls (ctrlParent _ctrlCheckbox) - [ctrlParentControlsGroup _ctrlCheckbox]);
private _controls = _all select {ctrlClassName _x find ["iedd_ied", 0] == 0};
private _isCharge = _controls select {ctrlClassName _x == "iedd_ied_isCharge"};
{
    private _ctrlclassname = ctrlClassName _x;
    if !("dist" in _ctrlclassname) then {
        _x ctrlEnable _state;
        _x ctrlSetFade _fade;
        _x ctrlCommit 0;
        private _type = (allControls _x) select 1;
        if (!_state && ctrlType _type == 77) then {
            _type cbSetChecked false;
        };
    } else {
        _x ctrlEnable !_state;
        _x ctrlSetFade ([0.75,0] select !_state);
        _x ctrlCommit 0;
    };
} forEach _controls-_isCharge;