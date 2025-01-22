// BUCKET
#include "script_component.hpp"
params ["_bombObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
[{
    params ["_bombObj"];
    private _variation = _bombObj getVariable [QGVAR(variation), GVAR(defaultVariation)];
    private _decals = _bombObj getVariable [QGVAR(decals), GVAR(defaultDecals)];
    private _setDir = _bombObj getVariable [QGVAR(dir), GVAR(defaultDirection)];
    private _isFake = _bombObj getVariable [QGVAR(fake), GVAR(defaultFake)];
    private _timerValue = _bombObj getVariable [QGVAR(timer), GVAR(defaultTimer)];
    private _isTimer = if (_timerValue > 1) then {selectRandom [false,true]} else {[false,true] select _timerValue};
    private _nonEOD = _bombObj getVariable [QGVAR(openClose), GVAR(defaultOpenClose)];
    private _isEOD = _bombObj getVariable [QGVAR(openCloseEOD), GVAR(defaultOpenCloseEOD)];
    TRACE_6("CBA Default values",_variation,_decals,_setDir,_isFake,_timerValue,_isTimer);
    if (_isFake > random 1) exitWith {
        private _type = getText (configFile >> "CfgVehicles" >> typeOf _bombObj >> "iedd_ied_default");
        private _dir = getDir _bombObj;
        private _vectorDir = vectorDir _bombObj;
        private _vectorUp = vectorUp _bombObj;
        private _vectorDirAndUp = [_vectorDir,_vectorUp];
        private _bombPos = getPosATL _bombObj;
        if (!isNull _bombObj) then {
            deleteVehicle _bombObj;
        };
        [{isNull (_this select 0)},
        {
            params ["_bombObj","_type","_bombPos","_decals","_setDir","_dir","_vectorDirAndUp"];
            private  _fakeBombObj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
            if (_setDir) then {
                _fakeBombObj setDir random 359;
            } else {
                _fakeBombObj setDir _dir;
            };
            _fakeBombObj setVectorDirAndUp _vectorDirAndUp;
            _fakeBombObj setPosATL _bombPos;
            if (_decals) then {
                [_fakeBombObj] call FUNC(decals);
            };
        }, [_bombObj,_type,_bombPos,_decals,_setDir,_dir,_vectorDirAndUp]] call CBA_fnc_waitUntilAndExecute;
    };

    if (GVAR(isDetectable)) then {
        private _mine = QGVAR(Charge_Ammo) createVehicle [0,0,0];
        _mine attachTo [_bombObj, [0,0,0]];
        private _jipId = ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
        [_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
        _jipId = [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
        [_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
    };

    if (_variation == 6) then {
        private _includeVarX = _bombObj getVariable [QGVAR(varX), GVAR(defaultVarX)]; //if 0% , Variation X will be excluded from Random
        if (_includeVarX > random 1) then {
            _variation = selectRandom [0,1,2,3,4,5];
        } else {
            _variation = selectRandom [0,1,2,3,4];
        };
    };

    private _isDistance = _bombObj getVariable [QGVAR(distance), 0];
    private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    _bombObj setVariable [QGVAR(dist),_distance];

    private _wireSet = if (_variation == 5) then
    {
        _bombObj setVariable [QGVAR(movable),selectRandom [false,true]];
        [6] call FUNC(variationx);
    } else {
        IEDD_BUCKET select _variation;
    };

    private _smallbox = createSimpleObject ["Land_BatteryPack_01_battery_black_F",[0,0,0]];
    _smallbox attachTo [_bombObj,[-0.03,-0.075,-0.155]];
    _smallbox setVectorDirAndUp [[1,-0,0],[0,0,1]];
    private _battery = createSimpleObject ["Land_CarBattery_02_F",[0,0,0]];
    _battery attachTo [_bombObj,[-0.002,0.04,-0.074]];
    _battery setVectorDirAndUp [[1,-0.008,-0],[-0.008,-1,-0.001]];

    private _subObj0 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#0),[0,0,0]];       // 0 wire
    private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1),[0,0,0]];  // 1 wire
    private _subObj2 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#2),[0,0,0]];       // 2 wire
    private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3),[0,0,0]];  // 3 wire
    private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4),[0,0,0]];  // 4 wire
    private _subObj5 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#5),[0,0,0]];       // 5 wire (long)
    private _subObj6 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#6),[0,0,0]];  // 6 (long)
    private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

    _subObjPosAndDir = [
        // Position                 VectorDirAndUp                  Description
        [[0.036,-0.049,-0.028], [[0,-1,0.009], [0,0.009,1]]],   // 1 wire
        [[0.014,-0.043,-0.152], [[1,-0.005,0], [-0.005,-1,0.001]]],// 2 wire
        [[-0.07,-0.037,-0.053], [[-1,0,0], [0,0,1]]],           // 3 wire  
        [[-0.035,-0.04,-0.078], [[0.117,-0.993,0], [0,0,1]]],   // 4 wire                     
        [[-0.054,-0.062,-0.071], [[-0.092,-0.986,0], [0,0,1]]], // 5 wire
        [[-0.033,-0.061,-0.073], [[-0.169,-0.986,0], [0,0,1]]], // 6 (long)
        [[0.009,-0.068,-0.188], [[0,-1,-0.019], [1,0,0.12]]]    // 7 (long)
    ];

    {
        private _wire = _x;
        _wire  attachTo [_bombObj,(_subObjPosAndDir select _forEachIndex) select 0];
        _wire  setVectorDirAndUp ((_subObjPosAndDir select _forEachIndex) select 1);
    } forEach _wires;

    _bombObj setVariable [QGVAR(wires), _wires, true];
    _bombObj setVariable [QGVAR(bomb), true, true];
    _bombObj setVariable [QGVAR(lid), [_nonEOD,_isEOD], true];
    if (_variation in [1,2,3]) then {
        _bombObj setVariable [QGVAR(movable),true];
    };

    if (_isTimer) then {
        private _watch = createSimpleObject ["a3\Weapons_F\Ammo\mag_watch.p3d",[0,0,0]];
        _watch attachTo [_battery, [0.105,0.075,0.158]];
        _watch setVectorDirAndUp [[-0.40,0.882948,0],[0.882948,0.469472,0.1]];
        private _randomValue = _bombObj getVariable [QGVAR(randomTimer), GVAR(defaultRandomTimer)];
        private _isRandom = if (_randomValue > 1) then {selectRandom [false,true]} else {[false,true] select _randomValue};
        TRACE_2("Timer",_isTimer,_isRandom);
        private _time = if (_isRandom) then {
            private _min = round (_bombObj getVariable [QGVAR(randomTimerMin),GVAR(defaultTimerMin)]);
            private _max = round (_bombObj getVariable [QGVAR(randomTimerMax),GVAR(defaultTimerMax)]);
            TRACE_2("min/max",_min,_max);
            [_min, _max] call BIS_fnc_randomInt;
        } else {
            TRACE_1("Value",(_bombObj getVariable [ARR_2(QGVAR(timerValue),GVAR(defaultTimerValue))]));
            round (_bombObj getVariable  [QGVAR(timerValue),GVAR(defaultTimerValue)]);
        };
        TRACE_1("time:",_time);
        _bombObj setVariable [QGVAR(timerValue), _time];
        _bombObj setVariable [QGVAR(timer),_isTimer, true];
    };

    [{
        [{
            speed (_this select 0) == 0
        },
        {
            params ["_bombObj","_decals", "_setDir", "_wireSet"];
            if (_setDir) then {
                private _bombPos = getPosATL _bombObj;
                _bombObj setDir random 359;
                _bombObj setPosATL _bombPos;
            };
            if (_decals) then {
                [_bombObj] call FUNC(decals);
            };
            private _text = localize LSTRING(Name_Long);
            private _jipId = [QGVAR(defuseAction), [_bombObj, _wireSet,_text]] call CBA_fnc_globalEventJIP;
            [_jipID, _bombObj] call CBA_fnc_removeGlobalEventJIP;
            [QGVAR(updateBombList), [_bombObj]] call CBA_fnc_serverEvent;
        }, _this] call CBA_fnc_waitUntilAndExecute;
    }, [_bombObj, _decals, _setDir, _wireSet], 1] call CBA_fnc_waitAndExecute;

},[_bombObj],0.1] call CBA_fnc_waitAndExecute;
true;









