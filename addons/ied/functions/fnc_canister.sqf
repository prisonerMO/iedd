//  CANISTER
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

    if (_variation isEqualTo 6) then {
        private _includeVarX = _bombObj getVariable [QGVAR(varX), GVAR(defaultVarX)]; //if 0% , Variation X will be excluded from Random
        If (_includeVarX > random 1) then {
            _variation = selectRandom [0,1,2,3,4,5];
        } else {
            _variation = selectRandom [0,1,2,3,4];
        };
    };
    
    if (_variation == 0) then {
        _bombObj setVariable [QGVAR(movable),true];
    };

    private _isDistance = _bombObj getVariable [QGVAR(distance), 0];
    private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    _bombObj setVariable [QGVAR(dist),_distance];

    private _wireSet = if (_variation == 5) then 
    {        
        _bombObj setVariable [QGVAR(movable),selectRandom [false,true]];
        [6] call FUNC(variationx);            
    } else {
        IEDD_CANVARS select _variation;
    };

    private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
    _box attachTo [_bombObj,[0.09,0.206,-0.133]];
    _box setVectorDirAndUp [[0.0,-1,0],[0,0,1]];

    private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0), [0,0,0]]; // 0 wire        	
    private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1), [0,0,0]]; // 1 wire    
    private _subObj2 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#2), [0,0,0]]; // 2 wire    
    private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3), [0,0,0]]; // 3 wire
    private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4), [0,0,0]]; // 4 wire
    private _subObj5 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#5), [0,0,0]];      // 5 wire (long)
    private _subObj6 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#6), [0,0,0]];      // 6 wire (long)
    private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

    private _subObjPosAndDir = [
        // Position                     VectorDirAndUp          Description
        [[0.143,    0.21,   -0.192],    [[0.191,0.98,-0.054],   [0.974,-0.196,-0.115]]],        	// 1 wire
        [[0.15,     0.205,  -0.164],    [[0.998,-0.024,0.061],  [0.02,0.998,0.066]]],        	    // 2 wire
        [[0.145,    0.213,  -0.144],    [[0.999,-0.041,0.028],  [0.02,0.848,0.53]]],        	    // 3 wire
        [[0.14,     0.203,  -0.119],    [[0.17,0.98,-0.104],    [0.983,-0.175,-0.046]]],        	// 4 wire
        [[0.12,     0.211,  -0.088],    [[0.07,0.997,-0.01],    [0.003,0.01,1]]],        			// 5 wire
        [[0.123,    0.232,  -0.193],    [[-0.002,0.995,-0.102], [0.048,0.102,0.994]]],       	    // 6 wire
        [[0.098,    0.234,  -0.193],    [[0.002,0.974,-0.225],  [-0.089,-0.224,-0.97]]]        	    // 7 wire
    ];

    {
        _x attachTo [_bombObj,(_subObjPosAndDir #_forEachIndex) #0];
        _x setVectorDirAndUp ((_subObjPosAndDir #_forEachIndex) #1);
    } forEach _wires;

    _bombObj setVariable [QGVAR(wires),_wires,true];
    _bombObj setVariable [QGVAR(bomb),true, true];
    _bombObj setVariable [QGVAR(variation),_variation,true];    
    _bombObj setVariable [QGVAR(timer),_isTimer, true];

    if (_isTimer) then {
        private _watch = createSimpleObject ["a3\Weapons_F\Ammo\mag_watch.p3d",[0,0,0]];
        _watch attachTo [_bombObj, [0.07,0.293,-0.116]];
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
            private _text = localize LSTRING(Name_Long);
            [QGVAR(defuseAction), [_bombObj, _wireSet,_text]] call CBA_fnc_globalEventJIP;
            [QGVAR(updateBombList),[_bombObj]] call CBA_fnc_serverEvent;        
        },
        [_bombObj,_decals, _setDir, _wireSet],
        1
    ] call CBA_fnc_waitUntilAndExecute;
},[_bombObj],0.1] call CBA_fnc_waitAndExecute;
true;










    
