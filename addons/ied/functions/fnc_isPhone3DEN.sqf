#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Initialize Bury IED control
 *
 *
 * Arguments:
 * 0: Argument (optional, default: value) <OBJECT>
 *
 * Return Value:
 * Return description <NONE>
 *
 * Example:
 * [ctrl] call iedd_ied_fnc_isPhone3DEN;
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
            systemChat format ['Phone sync changed: %1 Time:%2 Connections: %3',_object,time,_connections];
        }];
        _ied setVariable [QGVAR(connectionEH),_connectionEH];
    };
}


