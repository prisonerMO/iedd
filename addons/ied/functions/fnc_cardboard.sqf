//  CARDBOARD
#include "script_component.hpp"
params ["_bombObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
private _variation = _bombObj getVariable [QGVAR(variation), 5];
private _decals = _bombObj getVariable [QGVAR(decals), false];
private _setDir = _bombObj getVariable [QGVAR(dir), false];
private _isFake = _bombObj getVariable [QGVAR(fake), 0];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};

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
private _distance = [GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt;
_bombObj setVariable [QGVAR(dist),_distance];

private _wireSet = IEDD_CDVARS select _variation;

private _battery1 = createSimpleObject ["Land_BatteryPack_01_battery_black_F",[0,0,0]];
_battery1 attachTo [_bombObj,[0.302,0.032,-0.152]];
_battery1 setVectorDirAndUp [[-0.001,-0.012,-1],[0.074,0.997,-0.012]];
private _battery2 = createSimpleObject ["Land_BatteryPack_01_battery_black_F",[0,0,0]];
_battery2 attachTo [_bombObj,[0.308,-0.133,-0.145]];
_battery2 setVectorDirAndUp [[0,1,0],[-0.002,0,1]];
private _cyl1 = createSimpleObject ["SCBACylinder_01_F",[0,0,0]];
_cyl1 attachTo [_bombObj,[0.014,0.079,-0.13]];
_cyl1 setVectorDirAndUp [[0.996,-0.086,-0.011],[0.065,0.658,0.75]];
private _cyl2 = createSimpleObject ["SCBACylinder_01_F",[0,0,0]];
_cyl2 attachTo [_bombObj,[0.022,-0.11,-0.13]];
_cyl2 setVectorDirAndUp [[0.999,-0.045,-0.01],[0.01,0.002,1]];

private _subObj0 = createSimpleObject ["IEDD_WireSmall"+(_wireSet #0#0), [0,0,0]];           
private _subObj1 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#1), [0,0,0]];  
private _subObj2 = createSimpleObject ["IEDD_WireSmall"+(_wireSet #0#2), [0,0,0]];   
private _subObj3 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#3), [0,0,0]];
private _subObj4 = createSimpleObject ["IEDD_WireL"+(_wireSet #0#4), [0,0,0]];
private _subObj5 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#5), [0,0,0]];
private _subObj6 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#6), [0,0,0]];
private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

private _subObjPosAndDir = [
    // Position            VectorDirAndUp          Description
    [[0.294,-0.064,-0.166],[[0.617,-0.043,-0.786], [0.03,-0.996,0.079]]],   // 1 wire
    [[0.304,-0.083,-0.115],[[0.052,-0.121,0.991],  [-0.069,0.99,0.124]]],   // 2 wire
    [[0.313,-0.01,-0.178], [[-0.961,-0.079,0.265], [0.068,-0.996,-0.053]]], // 3 wire
    [[0.325,-0.082,-0.116],[[-0.098,-0.182,0.978], [-0.141,0.976,0.167]]],  // 4 wire
    [[0.289,-0.083,-0.117],[[0.016,-0.318,0.948],  [-0.096,0.943,0.318]]],  // 5 wire
    [[0.285,0.062,-0.131], [[0.301,0.954,0],       [-0.95,0.3,0.082]]],     // 6 wire (short)
    [[0.288,-0.15,-0.132], [[-0.997,-0.043,0.061], [0.049,-0.995,0.089]]]   // 7 wire (short)
];
{
    _x attachTo [_bombObj,(_subObjPosAndDir #_forEachIndex) #0];
    _x setVectorDirAndUp ((_subObjPosAndDir #_forEachIndex) #1);
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







    
