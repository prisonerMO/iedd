#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Check if IEDs has phone and if players are within the phone distance. If so, trigger the IED.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call iedd_ied_fnc_phoneCheck
 *
 * Public: No
 */

private _checkTime = 5;
if (GVAR(phoneBombs) isNotEqualTo []) then {
    private _players = call CBA_fnc_players;
    private _objectsToRemove = [];
    {
        private _object = _x;
        if (isNull _object) then {
            _objectsToRemove pushBack _object;
            continue;
        };
        private _removeCheck= _object getVariable [QGVAR(removeCheck),false];
        if (_removeCheck) then {
            private _var = _object getVariable [QGVAR(movable),false];        
            if (!_var) then {
                if (speed _object > 5 || !isNull attachedTo _object) then {
                    [QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
                    _objectsToRemove pushBack _object;
                    continue;
                };
            } else {
                private _veh = attachedTo _object;
                if (isNull attachedTo _veh) then {
                private _vehSpeed = speed _veh;
                    if (_vehSpeed > 45|| _vehSpeed < -45)  then {
                        [QGVAR(explosion), [_object]] call CBA_fnc_serverEvent;
                        _objectsToRemove pushBack _object;
                        continue;
                    };
                };
            }; 
        };       
        private _distance = _object getVariable [QGVAR(phoneDist),25];
        TRACE_2("Phone distance",_object,_distance);
        private _index = _players findIf {_object distance _x < _distance} != -1;
        if (_index) then {
            _objectsToRemove pushBack _object;
            _object call FUNC(phoneHandler);
        };
    } forEach GVAR(phoneBombs);
    GVAR(phoneBombs) = GVAR(phoneBombs) - _objectsToRemove;
    _checkTime = 0.33;
};
TRACE_3("Current objects",count GVAR(phoneBombs),time,_checkTime);
[FUNC(phoneCheck), [], _checkTime] call CBA_fnc_waitAndExecute;


