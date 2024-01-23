//  JERRY
#include "script_component.hpp"
params [ "_bombObj"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
private _variation = _bombObj getVariable [QGVAR(variation), 5];
private _decals = _bombObj getVariable [QGVAR(decals), false];
private _setDir = _bombObj getVariable [QGVAR(dir), false];
private _isFake = _bombObj getVariable [QGVAR(fake), 0];
private _color = _bombObj getVariable [QGVAR(color), "green"];

if (_color in [CSTRING(Name_Random),"random"]) then {
    _color = selectRandom ["green", "Blue", "red", "White"];
};

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
        params ["_bombObj","_type","_bombPos","_decals","_setDir","_dir","_vectorDirAndUp","_color"];
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
        if (_color != "green") then {
            _fakeBombObj setObjectTextureGlobal ["camo", "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_"+_color+"_co.paa"]   
        };
    }, [_bombObj,_type,_bombPos,_decals,_setDir,_dir,_vectorDirAndUp,_color]] call CBA_fnc_waitUntilAndExecute;
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
if (_variation == 3) then {
    _bombObj setVariable [QGVAR(movable),true];
};
private _distance = [GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt;
_bombObj setVariable [QGVAR(dist),_distance];

private _wireSet = IEDD_JERRYVARS select _variation;

private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
_box attachTo [_bombObj,[-0.102,-0.081,-0.160]];
_box setVectorDirAndUp [[-0,1,-0],[-0.022,-0,-1]];

private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0), [0,0,0]]; // 0 wire        	
private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1), [0,0,0]]; // 1 wire    
private _subObj2 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#2), [0,0,0]]; // 2 wire    
private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3), [0,0,0]]; // 3 wire
private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4), [0,0,0]]; // 4 wire
private _subObj5 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#5), [0,0,0]];      // 5 wire (long)
private _subObj6 = createSimpleObject ["IEDD_WireC"+(_wireSet #0#6), [0,0,0]];      // 6 (long)
private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

_subObjPosAndDir = [

    [[-0.08,-0.077,-0.049],[[0.018,-1,-0.01],[0.003,-0.01,1]]],
    [[-0.102,-0.083,-0.065],[[-0.061,0.024,0.998],[-0.446,-0.895,-0.006]]],
    [[-0.129,-0.086,-0.069],[[0.08,-0.997,-0.01],[0.003,-0.01,1]]],
    [[-0.1,-0.069,-0.089],[[-0.052,0.165,0.985],[0.03,-0.986,0.166]]],
    [[-0.144,-0.092,-0.075],[[-0.051,-0.111,0.993],[-0.005,-0.994,-0.111]]],
    [[-0.055,-0.107,-0.172],[[0.992,0,-0.122],[-0.122,-0.024,-0.992]]],
    [[-0.148,-0.103,-0.17],[[-1,-0.015,-0.001],[-0.001,-0.002,1]]]
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
        params ["_bombObj","_decals", "_setDir", "_wireSet","_color"];
        if (_setDir) then {
            private _bombPos = getPosATL _bombObj;
            _bombObj setDir random 359;
            _bombObj setPosATL _bombPos;
        };               
        if (_decals) then {
            [_bombObj] call FUNC(decals);
        };
        if (_color != "green") then {
            _bombObj setObjectTextureGlobal ["camo", "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_"+_color+"_co.paa"]   
        };
        [QGVAR(defuseAction), [_bombObj, _wireSet]] call CBA_fnc_globalEventJIP;
        [QGVAR(updateBombList),[_bombObj]] call CBA_fnc_serverEvent;  
    },
    [_bombObj,_decals, _setDir,_wireSet,_color],
    1
] call CBA_fnc_waitUntilAndExecute;

true;








    
