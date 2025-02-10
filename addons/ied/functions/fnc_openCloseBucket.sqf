#include "script_component.hpp"
params ["_target", "_player", "_state"];
//TO-DO 3s progress bar. The explosion can occur 1-2 seconds after the start of the interaction.
private _checkTime = [0,1.8] select (_hasWpn);
if (_hasWpn) then {
    [_player] call ace_weaponselect_fnc_putWeaponAway;
};
[{
    params ["_target", "_player", "_state"];
    private _text = ["Closing lid...", "Opening lid..."] select _state;
    private _lid = _target getVariable [QGVAR(lid), [0,0]];
    private _expChance = _lid select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
    TRACE_1("params:",_this);
    private _isExp = random 1 < _expChance;
    if (_isExp) then {
        GVAR(lid) = true;
    };
    private _openTime = 3;
    private _isExpTime = random(2)+1;
    TRACE_3("Chances:",_isExp,_expChance,_isExpTime);
    _this set [3, _isExp];
    _this set [4, _isExpTime];
    [
        3,
        [_this],
        {
            params ["_actionParams"];
            _actionParams #0 params ["_target", "_player", "_state"];
            _target animate ["bucketlid_hide", _state];
            private _isTimer = _target getVariable [QGVAR(timer), false];
            if (_target getVariable [QGVAR(bomb), false] && {
                _state > 0 && {
                (_isTimer in [true,1])}}) then {
                [QGVAR(timer), [_target]] call CBA_fnc_serverEvent;
                _target setVariable [QGVAR(timer), false, true];
            };
        },
        {
            params ["_actionParams"];
            _actionParams #0 params ["_target", "_player", "_state"];
            if (GVAR(lid)) then {
                GVAR(lid) = false;
            };
        },
        _text,
        {
            params ["_actionParams","_elapsedTime", "_totalTime"];
            _actionParams #0 params ["_target", "", "","_isExp","_isExpTime","_state"];
            if (GVAR(lid) && _isExpTime/10 < _elapsedTime) then {
                [QGVAR(sound), [QGVAR(fail2), _target]] call CBA_fnc_globalEvent;
                GVAR(lid) = false;
            };
            if (_isExp && _elapsedTime > _isExpTime) then {
                _actionParams #0 set [3, false];
                [QGVAR(explosion), [_target]] call CBA_fnc_globalEvent;
            };
            true;
        },
        ["isNotSwimming"]
    ] call ace_common_fnc_progressBar;
}, _this, _checkTime] call CBA_fnc_waitAndExecute;