//  CINDER
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
            private  _fakeBombObj = createVehicle [_type, _bombPos, [], 0, "CAN_COLLIDE"];
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
        ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
        [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
    };

    if (_variation > 4) then {
        _variation = floor (random 5);
    };
    
    private _isDistance = _bombObj getVariable [QGVAR(distance), 0];
    private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    _bombObj setVariable [QGVAR(dist),_distance];

    private _wireSet = IEDD_CINDERVARS select _variation;

    private _gasCan1 = createSimpleObject ["Land_GasCanister_F",[0,0,0]];
    _gasCan1 attachTo 	[_bombObj,[-0.002,0.08,-0.053]];
    _gasCan1 setVectorDirAndUp [[0,1,-0.015],[0.002,0.015,1]];
    private _gasCan2 = createSimpleObject ["Land_GasCanister_F",[0,0,0]];
    _gasCan2 attachTo 	[_bombObj,[0,-0.079,-0.053]];
    _gasCan2 setVectorDirAndUp [[0,1,-0.015],[0.002,0.015,1]];
    private _battery1 = createSimpleObject ["Land_Battery_F", [0,0,0]];
    _battery1 attachTo 	[_bombObj,[-0.047,0.108,0.009]];
    _battery1 setVectorDirAndUp [[0,0.008,1],[0.002,-1,0.008]];
    private _battery2 = createSimpleObject ["Land_Battery_F", [0,0,0]];
    _battery2 attachTo 	[_bombObj,[-0.013,0.108,0.014]];
    _battery2 setVectorDirAndUp [[-0.955,0.023,0.296],[-0,-0.997,0.078]];
    private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0), [0,0,0]]; // 0 wire        	
    private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1), [0,0,0]]; // 1 wire    
    private _subObj2 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#2), [0,0,0]]; // 2 wire    
    private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3), [0,0,0]]; // 3 wire
    private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4), [0,0,0]]; // 4 wire
    private _subObj5 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#5), [0,0,0]]; // 5 wire (long)
    private _subObj6 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#6), [0,0,0]]; // 6 wire (long)
    private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

    private _subObjPosAndDir = [
        // Position     VectorDirAndUp      Description
        [[0.055,0.02,0.02],[[-0.998,0.06,0.001],[0.06,0.998,-0.031]]],        		// 1. wire
        [[-0.044,0.047,-0.012],[[-0.06,-0.982,0.181],[-0.161,0.188,0.969]]],        // 2. wire
        [[0.055,0.02,-0.005],[[-0.999,0.043,-0.026],[0.045,0.995,-0.091]]],        	// 3. wire
        [[0.053,0.018,0.002],[[-0.155,0.987,0.052],[-0.988,-0.156,0.009]]],        	// 4. wire
        [[-0.021,0.048,-0.003],[[0.313,-0.003,0.95],[0.001,-1,-0.004]]],        	// 5. wire
        [[-0,-0.049,0.007],[[0.307,-0.78,0.546],[-0.023,0.567,0.823]]],       		// 6. (short)
        [[-0.013,-0.048,0.002],[[-0.169,0.458,0.872],[0.274,-0.828,0.489]]]         // 7. (short)
    ];

    {
        _x attachTo [_bombObj,(_subObjPosAndDir #_forEachIndex) #0];
        _x setVectorDirAndUp ((_subObjPosAndDir #_forEachIndex) #1);
    } forEach _wires;

    _bombObj setVariable [QGVAR(wires),_wires,true];
    _bombObj setVariable [QGVAR(bomb),true,true];
    _bombObj setVariable [QGVAR(variation),_variation,true];    
    _bombObj setVariable [QGVAR(timer),_isTimer, true];

    if (_isTimer) then {
        private _watch = createSimpleObject ["a3\Weapons_F\Ammo\mag_watch.p3d",[0,0,0]];
        _watch attachTo [_bombObj,[-0.022,0.1035,0.0718]];
        _watch setVectorDirAndUp [[-0.0697565,0,0.997564],[-0.997564,0,-0.0697565]];
        private _randomValue = _bombObj getVariable [QGVAR(randomTimer), GVAR(defaultRandomTimer)];
        private _isRandom = if (_randomValue > 1) then {selectRandom [false,true]} else {[false,true] select _randomValue};
        private _time = if (_isRandom) then {
            private _min = round (_bombObj getVariable [QGVAR(randomTimerMin),GVAR(defaultTimerMin)]);
            private _max = round (_bombObj getVariable [QGVAR(randomTimerMax),GVAR(defaultTimerMax)]);
            [_min, _max] call BIS_fnc_randomInt;
        } else {
            round (_bombObj getVariable  [QGVAR(timerValue),GVAR(defaultTimerValue)]);
        };
        _bombObj setVariable [QGVAR(timerValue),_time];
    };

    [
        {speed (_this select 0) == 0},
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
            //private _text = format ["(%1)",localize LSTRING(Name_Long)];
            private _text = "(long)";  
            [QGVAR(defuseAction), [_bombObj, _wireSet,_text]] call CBA_fnc_globalEventJIP;
            [QGVAR(updateBombList),[_bombObj]] call CBA_fnc_serverEvent;  
        },
        [_bombObj,_decals, _setDir, _wireSet],
        1
    ] call CBA_fnc_waitUntilAndExecute;
},[_bombObj],0.1] call CBA_fnc_waitAndExecute;
true;











    
