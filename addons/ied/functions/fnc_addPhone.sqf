#include "script_component.hpp"
/*
 * Author: Prisoner
 * Bury IED
 *
 *
 * Arguments:
 * 0: IED Object <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [_ied] call iedd_ied_fnc_addPhone;
 *
 * Public: No
 */
 params [
    ["_ied",objNull]
];
TRACE_1("fnc_addPhone",_this);
private _unit = _ied getVariable [QGVAR(phoneUnit), ""];
if (_unit isEqualTo "") then {
    private _getSyncedUnits = synchronizedObjects _ied;
    if (_getSyncedUnits isNotEqualTo []) then {
        _unit = _getSyncedUnits select 0;
    };
    if (_unit isEqualTo "") exitWith {
        diag_log format ["IED: No synced unit found for %1", _ied];
    }; 
};
private _number = _ied getVariable [QGVAR(phoneNumber), "1234"];
private _configOf = configOf _ied;
private _pos = getArray (_configOf >> QGVAR(phonePos));
private _dir = getArray (_configOf >> QGVAR(phoneDir));
private _up = getArray (_configOf >> QGVAR(phoneUp));
private _phone = createSimpleObject [QGVAR(Phone), [0,0,0]];
_phone attachTo [_ied, _pos];
_phone setVectorDirAndUp [_dir, _up];
