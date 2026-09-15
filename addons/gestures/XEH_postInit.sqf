#include "script_component.hpp"
/*If dialing*/
["unit", {
    params ["_newUnit", "_oldUnit"];
    _oldUnit call FUNC(stopDial);

    // Add EHs one time only (won't be re-added on respawn)
    if (_newUnit getVariable [QGVAR(hasEHS), false]) exitWith {};
    _newUnit setVariable [QGVAR(hasEHS), true];

    _newUnit addEventHandler ["GetInMan", {
        params ["_unit"];
        TRACE_1("GetInMan",_unit);
        _unit call FUNC(stopDial);
    }];

    _newUnit addEventHandler ["WeaponDeployed", {
        params ["_unit", "_isDeployed"];
        TRACE_2("WeaponDeployed",_unit,_isDeployed);
        if (_isDeployed) then {
            _unit call FUNC(stopDial);
        };
    }];
}, true] call CBA_fnc_addPlayerEventHandler;
