#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Open or close bucket lid
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [target, player, true] call iedd_ied_fnc_openCloseBucket
 *
 * Public: No
 */

params ["_target", "_player", "_state"];
TRACE_1("fnc_openCloseBucket",_this);

private _hasWpn = currentWeapon _player != "";
private _checkTime = [0,1.8] select (_hasWpn);
if (_hasWpn) then {
    [_player] call ace_weaponselect_fnc_putWeaponAway;
};
[{
    params ["_target", "_player", "_state"];
    private _text = ["Closing lid...", "Opening lid..."] select _state;
    private _lid = _target getVariable [QGVAR(lid), [GVAR(defaultOpenCloseEOD), GVAR(defaultOpenCloseEOD)]];
    private _expChance = _lid select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
    TRACE_1("params:",_this);
    private _isExp = random 1 < _expChance;
    private _lidSound = _isExp;
    private _openTime = 3;
    private _isExpTime = random(2)+1;
    TRACE_4("Chances:",_isExp,_expChance,_isExpTime,_lidSound);
    _this set [3, _isExp];
    _this set [4, _isExpTime];
    _this set [5, _lidSound];
    [
        3,
        [_this],
        {
            params ["_actionParams"];
            _actionParams #0 params ["_target", "_player", "_state"];
            _target animate ["bucketlid_hide", _state];
            private _isTimer = _target getVariable [QGVAR(timer), false];
            if (alive _target && {
                _target getVariable [QGVAR(bomb), false] && {
                _state > 0 && {
                (_isTimer in [true,1])}}}) then {
                [QGVAR(timer), [_target]] call CBA_fnc_serverEvent;
                _target setVariable [QGVAR(timer), false, true];
            };
        },
        {
            params ["_actionParams"];
            _actionParams #0 params ["_target", "_player", "_state"];
        },
        _text,
        {
            params ["_actionParams","_elapsedTime", "_totalTime"];
            _actionParams #0 params ["_target", "", "","_isExp","_isExpTime","_state","_lidSound"];
            if (_lidSound && _isExpTime/10 < _elapsedTime) then {
                [QGVAR(sound), [QGVAR(fail2), _target]] call CBA_fnc_globalEvent;
                _actionParams #0 set [5, false];
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