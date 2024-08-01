//  CHARGE
#include "script_component.hpp"
params ["_unit","_activated"];
TRACE_1("Charge call",_this);
if (is3DEN) exitWith {
    private _value = (_unit get3DENAttribute QGVAR(isSurrendered)) select 0;
    [_unit,_value,"ace_isSurrendered",QGVAR(isSurrendered)] call FUNC(setAttributes);
    _value = (_unit get3DENAttribute QGVAR(isHandcuffed)) select 0;
    [_unit,_value,"ace_isHandcuffed",QGVAR(isHandcuffed)] call FUNC(setAttributes);
};
if (!_activated) exitWith {TRACE_1("ExitWith _actived:",_activated)};
if (!isServer) exitWith {TRACE_1("ExitWith isServer:",isServer)};
[
    {!isNull (_this select 0)},
    {
        params ["_unit"];
        TRACE_1("Bomb vest unit",_this);
        private _expl1 = createSimpleObject [QGVAR(Charge), [0,0,0]];
        _expl1 attachTo [_unit, [-0.15, 0.13, -0.18], "spine3",true];
        _expl1 setVectorDirAndUp [[-0.707107,-0.707107,0],[0.707107,-0.707107,0]];
        private _expl3 = createSimpleObject [QGVAR(Charge), [0,0,0]];
        _expl3 attachTo [_unit, [0.15, 0.13, -0.18], "spine3",true];
        _expl3 setVectorDirAndUp [[-0.707107,0.707107,0],[-0.707107,-0.707107,0]];
        private _bombObj = QGVAR(Charge) createVehicle position _unit;
        _bombObj attachTo [_unit , [0, 0.2, -0.18], "spine3",true];
        _bombObj setVectorDirAndUp [[-1,0,0],[-0,-1,0]];
		private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
		_box attachTo [_bombObj,[0,0,0]];
		_box setVectorDirAndUp [[0,0,1],[-1,0,0]];

        private _variation = _unit getVariable [QGVAR(c_variation),5];
        private _dud = _unit getVariable [QGVAR(c_dud),0];
        private _size = _unit getVariable [QGVAR(c_size),2];
        private _isSuicide = _unit getVariable [QGVAR(isSuicide),false];

        _bombObj setVariable [QGVAR(size),_size,true];
        _bombObj setVariable [QGVAR(dud),_dud,true];
        {
            _x addEventHandler ["Deleted", {(_this select 0) call FUNC(deleted)}];
        } forEach [_unit, _bombObj];

        if (_variation > 4) then {
            _variation = floor (random 5);
        };
        TRACE_4("IED Bomb Vest:",_bombObj,_variation,_bombObj getVariable QGVAR(size),_bombObj getVariable QGVAR(dud));
        if (GVAR(isDetectable)) then {
            private _mine = QGVAR(Charge_Ammo) createVehicle [0,0,0];
            _mine attachTo [_bombObj, [0,0,0]];
            private _jipId = ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
            [_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
            _jipId = [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
            [_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
        };
        private _wireSet = IEDD_CHARGE select _variation;
        private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0), [0,0,0]]; // 0 wire
        private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1), [0,0,0]]; // 1 wire
        private _subObj2 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#2), [0,0,0]]; // 2 wire
        private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3), [0,0,0]]; // 3 wire
        private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4), [0,0,0]]; // 4 wire
        private _subObj5 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#5), [0,0,0]];	// 5 wire (long)
        private _subObj6 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#6), [0,0,0]];	// 6 (long)
        private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

        _subObjPosAndDir = [
            [[0.108,0.04,-0.01],[[1,0,0],[0.2,1,-4.3]]],
            [[0.102,0.014,0.01],[[1,0,0],[0,1,-4.3]]],
            [[0.104,-0.003,0.01],[[1,0,0],[0,1,-4.3]]],
            [[0.109,-0.021,0.01],[[1,0.1,0],[-0.4,1,-44]]],
            [[0.105,-0.045,-0.01],[[1,0,0],[0,1,-25]]],
            [[0.120,0.066,0.04],[[-0,-0.642788,-0.766045],[0.34202,0.766045,-0.604023]]],
            [[0.120,-0.066,0.043],[[-0,-0.64202,-0.739693],[0,0.939693,-0.34202]]]
        ];

        {
            _x attachTo [_bombObj,(_subObjPosAndDir select _forEachIndex) select 0];
            _x setVectorDirAndUp ((_subObjPosAndDir select _forEachIndex) select 1);
        } forEach _wires;

        _bombObj setVariable [QGVAR(wires), _wires, true];
        _bombObj setVariable [QGVAR(bomb), true, true];
        _bombObj setVariable [QGVAR(variation),_variation, true];

        private _jipIdAction = [QGVAR(disarmAction), [_bombObj]] call CBA_fnc_globalEventJIP;
        [_jipIdAction, _bombObj] call CBA_fnc_removeGlobalEventJIP;
        private _text = LLSTRING(Name_Short);
        _jipIdActions = [QGVAR(defuseAction), [_bombObj, _wireSet,_text]] call CBA_fnc_globalEventJIP;
        [_jipIdAction, _bombObj] call CBA_fnc_removeGlobalEventJIP;

        private _getInManEhId = _unit getVariable [QGVAR(GetInManEhId), -1];
        if (_getInManEhId != -1) then {
            _unit removeEventHandler ["GetInMan", _getInManEhId];
        };
        _getInManEhId = _unit addEventHandler ["GetInMan", {
            _this call FUNC(handleGetInMan);
        }];
        _unit setVariable [QGVAR(GetInManEhId), _getInManEhId,true]; // need to be global?

        if (!_isSuicide) then {
            //if unit is NOT suicide bomber
            [_unit, "forceWalk", QGVAR(charge), true] call ace_common_fnc_statusEffect_set;
            //Currenlty raise event there where _unit is local
            [QGVAR(addLocal), [_unit], _unit] call CBA_fnc_targetEvent;
            //if locality change add event on new machine
            _unit addEventHandler ["Local", {
                params ["_entity","_isLocal"];
                if (_isLocal) then {
                    [QGVAR(addLocal), [_entity], _entity] call CBA_fnc_targetEvent;
                } else {
                    private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
                    if (_killedEhId != -1) then {
                        _unit removeEventHandler ["Killed", _killedEhId];
                    };
                };
            }];

            private _timerValue = _unit getVariable [QGVAR(c_timer), GVAR(defaultTimer)];
            private _isTimer = if (_timerValue > 1) then {selectRandom [false,true]} else {[false,true] select _timerValue};
            _bombObj setVariable [QGVAR(timer),_isTimer, true];
            if (_isTimer) then {
                private _watch = createSimpleObject ["a3\Weapons_F\Ammo\mag_watch.p3d",[0,0,0]];
                _watch attachTo [_bombObj,[0.02,-0.095,0.028]];
                _watch setVectorDirAndUp [[-0,-1,0],[1,0,0]];
                _bombObj setVariable [QGVAR(unit),_unit];
                private _randomValue = _unit getVariable [QGVAR(c_randomTimer), GVAR(defaultRandomTimer)];
                private _isRandom = if (_randomValue > 1) then {selectRandom [false,true]} else {[false,true] select _randomValue};
                private _time = if (_isRandom) then {
                    private _min = round (_unit getVariable [QGVAR(c_randomTimerMin),GVAR(defaultTimerMin)]);
                    private _max = round (_unit getVariable [QGVAR(c_randomTimerMax),GVAR(defaultTimerMax)]);
                    [_min, _max] call BIS_fnc_randomInt;
                } else {
                    round (_unit getVariable  [QGVAR(c_timerValue),GVAR(defaultTimerValue)]);
                };
                _bombObj setVariable [QGVAR(timerValue),_time];
            };
        } else {
            [_unit] call FUNC(suicide);
        };
        TRACE_2("IED Bomb Vest EHs:",_unit getVariable QGVAR(KilledEhId),_unit getVariable QGVAR(GetInManEhId));
    },
    [_unit],
    0.5
] call CBA_fnc_waitUntilAndExecute;

true;
