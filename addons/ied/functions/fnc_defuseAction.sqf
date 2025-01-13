#include "script_component.hpp"
if (!hasInterface) exitWith {};
[{
    params ["_bombObj","_wireSet","_text"];
    TRACE_1("DefuseAction:",_this);
    if (isNull _bombObj) exitWith {};
    private _wires = _bombObj getVariable [QGVAR(wires),[]];
    private _countWires = count _wires-1;
    private _shuffleArray = [];
    for "_i" from 0 to _countWires do {
        _shuffleArray pushBack _i;
    };
    private _r = _shuffleArray call BIS_fnc_arrayShuffle;
    for "_i" from 0 to _countWires do {
        private _s = _r select _i;
        private _wire = _wires #_s;
        private _order = _wireSet #1 #_s;
        private _color = (_wireSet #0 #_s);
        private _wireColor = if (_s < 5) then {
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
                private _cutTime = [iedd_ied_wireCutTime, iedd_ied_wireCutTimeEOD] select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
                if (_cutTime < 1) then {
                    _cutTime = 1;
                };
                TRACE_1("params:",_this);
                private _failChance = [GVAR(failChance), GVAR(failChanceEOD)] select ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist");
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
                        [_player,_wire, _bombObj, _order,_isFail] call FUNC(cutWire);
                    },
                    {
                        params ["_actionParams","_player"];
                        _actionParams #0 params ["", "_bombObj", "","_isFail"];
                        if (GVAR(fail)) then {
                            GVAR(fail) = false;
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
                            GVAR(fail) = true;
                            [QGVAR(sound), [QGVAR(fail1),_bombObj]] call CBA_fnc_globalEvent;
                        };
                        true;
                    },
                    ["isNotSwimming"]
                ] call ace_common_fnc_progressBar;
            }, _this, _checkTime] call CBA_fnc_waitAndExecute;
        };
        private _iedSubAction = [_color, format ["%1 %2", LLSTRING(Name_Cut),toLower _wireColor], "", _statement, _condition,{},[_wire, _bombObj, _order], "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
        [_bombObj, 0, ["ACE_MainActions", "IEDD_DisarmMenu"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;
    };
}, _this] call CBA_fnc_execNextFrame;