#include "../script_component.hpp"
//currenlty not in use
params ["_target"];
diag_log format ["DISARM CALLED %1", _this];
private _actions = [];
private _bombObj = attachedTo _target;
if (isNull _bombObj) exitWith {_actions};
private _setup = _target getVariable [QGVAR(setup),[]];
diag_log format ["DISARM _setup %1", _setup];
private _wires = _setup get "wires";
private _wireSet = _setup get "wireset";
private _text = _setup get "text";
private _countWires = count _wires-1;
for "_i" from 0 to _countWires do {
    private _wire = _wires #_i;
    private _order = _wireSet #1 #_i;
    private _color = (_wireSet #0 #_i);
    private _wireColor = if (_i < 5) then {
        localize format ["$STR_iedd_ied_Name_%1",_color];
    } else {
        format ["%1 %2",_text,localize (format ["$STR_iedd_ied_Name_%1",_color])];
    };

    private _condition = {
        params ["_target", "_player", "_actionParams"];
        _actionParams params ["_wire"];
        !isNull _wire;
    };

    private _statement = {
        params ["_target", "_player", "_actionParams"];
        private _hasWpn = currentWeapon _player != "";
        private _checkTime = [0,1.8] select (_hasWpn);
        if (_hasWpn) then {
            [_player] call ace_weaponselect_fnc_putWeaponAway;
        };
        [{
            params ["_target", "_player", "_actionParams"];
            _actionParams params [
                "_wire",
                "_bombObj",
                "_order",
                ["_isFail",false],
                ["_isFailTime",0.1]
            ];
            private _cutTime = [EGVAR(ied,wireCutTime), EGVAR(ied,wireCutTimeEOD)] select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
            if (_cutTime < 1) then {
                _cutTime = 1;
            };
            TRACE_1("params:",_this);
            private _failChance = [EGVAR(ied,failChance), EGVAR(ied,failChanceEOD)] select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
            private _isFail = random 1 < _failChance;
            private _isFailTime = _cutTime / 10;
            TRACE_3("Chance:",_cutTime,_failChance,_isFail);
            _actionParams set [3,_isFail];
            _actionParams set [4,_isFailTime];
            [
                _cutTime,
                [_actionParams,_player],
                {
                    params ["_actionParams","_player"];
                    _actionParams #0 params ["_wire", "_bombObj","_order","_isFail"];
                    _actionParams #1 params ["_player"];
                    [_player,_wire, _bombObj, _order,_isFail] call EFUNC(ied,cutWire);
                },
                {
                    params ["_actionParams","_player"];
                    _actionParams #0 params ["", "_bombObj", "","_isFail"];
                    if (EGVAR(ied,fail)) then {
                        EGVAR(ied,fail) = false;
                    };
                    /* NOT IN USE , -> CANCEL CHANCE EXPLODE?
                    if (!GVAR(fail)) then {
                        GVAR(fail) = true;
                        [QGVAR(sound), [QGVAR(fail1),_bombObj]] call CBA_fnc_globalEvent;
                    };
                    [{
                        params ["_isFail","_bombObj"];
                        if (_isFail) then {
                            private _exploseChance = random 1;
                            if (_exploseChance < GVAR(failExploseChance)) then {
                                [QGVAR(explosion), [_bombObj]] call CBA_fnc_serverEvent;
                            };
                        };
                        GVAR(fail) = false;
                    },[_isFail,_bombObj],1] call CBA_fnc_waitAndExecute;
                    */
                },
                "Working...",
                {
                    params ["_actionParams","_elapsedTime", "_totalTime"];
                    _actionParams #0 params ["", "_bombObj","","_isFail","_isFailTime"];

                    if (_isFail && _elapsedTime > _isFailTime && !GVAR(fail)) then {
                        EGVAR(ied,fail) = true;
                        [QEGVAR(ied,sound), [QEGVAR(ied,fail1),_bombObj]] call CBA_fnc_globalEvent;
                    };
                    true;
                },
                ["isNotSwimming"]
            ] call ace_common_fnc_progressBar;
        }, _this, _checkTime] call CBA_fnc_waitAndExecute;
    };
    private _iedSubAction = [_color, format ["%1 %2",LELSTRING(ied,Name_Cut),toLower _wireColor], "", _statement, _condition,{},[_wire, _bombObj, _order], "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_iedSubAction, [], _target];
};

_actions