#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if an IED has a phone in 3DEN.
 *
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 * 1: Argument (optional, default: value) <BOOL>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [obj, true] call iedd_ied_fnc_isPhone3DEN;
 *
 * Public: No
 */

//params [];
params ["_ied", "_state"];
TRACE_1("fnc_isPhone3DEN",_this);
systemChat format ['fnc_isPhone3DEN: %1',_this];
if (_state) then {
    private _index = _ied getVariable [QGVAR(connectionEH),-1];
    if (_index == -1) then {
        private _connectionEH = _ied addEventHandler ['ConnectionChanged3DEN', {
            params ['_object'];
            private _connections = get3DENConnections _object;
            private _units = flatten _connections select {_x isKindOf "CAManBase"};
            private _phoneUnit = _object get3DENAttribute QGVAR(phoneUnit) select 0;
            if (_phoneUnit != "") then {
                private _hasUnit = _units findIf {(_x get3DENAttribute "name" select 0) isEqualTo _phoneUnit};
                if (_hasUnit != -1) exitWith {systemChat format ['fnc_isPhone3DEN: %1 already has a phone unit connected',_object];};
            };
            if (_units isNotEqualTo []) then {
                private _unit = _units select 0;
                private _name = _unit get3DENAttribute "name" select 0;
                _object set3DENAttribute [QGVAR(phoneUnit),_name];
            };            
        }];
        _ied setVariable [QGVAR(connectionEH),_connectionEH];
    };
};


