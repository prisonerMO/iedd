// BARREL
#include "script_component.hpp"
params ["_bombObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
private _variation = _bombObj getVariable [QGVAR(variation), 5];
private _decals = _bombObj getVariable [QGVAR(decals), false];
private _setDir = _bombObj getVariable [QGVAR(dir), false];
private _isFake = _bombObj getVariable [QGVAR(fake), 0];

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
    private _mine = QEGVAR(equipment,mine_ammo) createVehicle [0,0,0];
    _mine attachTo [_bombObj, [0,0,0]];
    ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
    [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
};

if (_variation > 4) then {
	_variation = floor (random 5);
};
if (_variation == 4) then {
    _bombObj setVariable [QGVAR(movable),true];
};

private _distance = [GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt;
_bombObj setVariable [QGVAR(dist),_distance];

private _wireSet = IEDD_BARRELVARS select _variation;

private _battery1 = createSimpleObject ["Land_BatteryPack_01_battery_black_F",[0,0,0]];
_battery1 attachTo 	[_bombObj,[0.174,0.006,0.148]];
_battery1 setVectorDirAndUp [[-0.417,0.909,0.001],[-0.908,-0.417,-0.032]];
private _battery2 = createSimpleObject ["Land_BatteryPack_01_battery_black_F",[0,0,0]];
_battery2 attachTo 	[_bombObj,[0.1,-0.159,0.168]];
_battery2 setVectorDirAndUp [[-0.447,0.894,0.02],[-0.011,0.017,-1]];
private _cyl1 = createSimpleObject ["SCBACylinder_01_F", [0,0,0]];
_cyl1 attachTo 	[_bombObj,[0.165,0.017,-0.146]];
_cyl1 setVectorDirAndUp [[0,0.041,0.999],[0.005,-0.999,0.041]];
private _cyl2 = createSimpleObject ["SCBACylinder_01_F", [0,0,0]];
_cyl2 attachTo 	[_bombObj,[0.074,-0.132,-0.152]];
_cyl2 setVectorDirAndUp [[0.006,0.012,1],[-0.725,0.689,-0.004]];

private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0),[0,0,0]]; // 0 wire        	
private _subObj1 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#1),[0,0,0]]; // 1 wire    
private _subObj2 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#2),[0,0,0]]; // 2 wire    
private _subObj3 = createSimpleObject ["IEDD_WireSmall"+(_wireSet #0#3),[0,0,0]]; // 3 wire
private _subObj4 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#4),[0,0,0]]; // 4 wire
private _subObj5 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#5),[0,0,0]];      // 5 wire (long)
private _subObj6 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#6),[0,0,0]];      // 6 (long)
private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

_subObjPosAndDir = [
    // Position                        VectorDirAndUp                            Description
    [[0.128,-0.084,0.135],[[1,0.027,-0],[0.027,-1,0.009]]],        			// 1 wire
    [[0.142,-0.061,0.126],[[-0.621,0.784,-0.002],[-0.781,-0.618,0.092]]],   // 2 wire
    [[0.134,-0.049,0.156],[[0.999,-0.032,-0.003],[-0.032,-0.991,0.13]]],    // 3 wire
    [[0.167,-0.058,0.118],[[-0.098,0.121,0.988],[-0.397,-0.915,0.072]]],    // 4 wire
    [[0.14,-0.059,0.151],[[-0.379,0.926,-0.005],[-0.896,-0.365,0.252]]],    // 5 wire
    [[0.078,-0.181,0.157],[[-0.907,-0.405,0.112],[0.323,-0.501,0.803]]],    // 6 wire (long)
    [[0.122,-0.065,0.12],[[-0.024,-0.037,-0.999],[0.541,0.84,-0.044]]]      // 7 wire (long)
];

{
    _x attachTo [_bombObj,(_subObjPosAndDir select _forEachIndex) select 0];
    _x setVectorDirAndUp ((_subObjPosAndDir select _forEachIndex) select 1);
} forEach _wires;

_bombObj setVariable [QGVAR(wires), _wires,true];
_bombObj setVariable [QGVAR(bomb), true, true];
_bombObj setVariable [QGVAR(variation),_variation,true];

[
    {speed (_this select 0) == 0},
    {     
        params ["_bombObj", "_variation", "_decals", "_setDir", "_wireSet", "_wires"];
        if (_setDir) then {           
            private _bombPos = getPosATL _bombObj;
            _bombObj setDir random 359;
            _bombObj setPosATL _bombPos;
        };               
        if (_decals) then {
            [_bombObj] call FUNC(decals);
        };
        private _attached = count attachedObjects _bombObj;
        private _wireCount = count _wires;
        private _uncount = _attached - _wireCount;
        [QGVAR(defuseAction), [_bombObj, _wireSet, _wires, _uncount]] call CBA_fnc_globalEventJIP;
        [QGVAR(updateBombList),[_bombObj]] call CBA_fnc_serverEvent;  
    },
    [_bombObj, _variation, _decals, _setDir, _wireSet, _wires],
    1
] call CBA_fnc_waitUntilAndExecute;

true;








    
