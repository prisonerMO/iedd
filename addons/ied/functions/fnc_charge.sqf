//  CHARGE
#include "script_component.hpp"
params ["_unit","_actived"];
if (is3DEN) exitWith {
    private _value = (_unit get3DENAttribute QGVAR(isSurrendered)) select 0;
    [_unit,_value,"ace_isSurrendered",QGVAR(isSurrendered)] call FUNC(setAttributes);
    _value = (_unit get3DENAttribute QGVAR(isHandcuffed)) select 0;
    [_unit,_value,"ace_isHandcuffed",QGVAR(isHandcuffed)] call FUNC(setAttributes);
};
if (!_activated) exitWith {};
if (!isServer) exitWith {};

// TODO CHECK THIS 
[_unit, "forceWalk", QGVAR(charge), true] call ace_common_fnc_statusEffect_set;

private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
if (_killedEhId != -1) then {
    _unit removeEventHandler ["Killed", _killedEhId];
};
_killedEhId = _unit addEventHandler ["Killed", {
    [_this select 0] call FUNC(handleKilled);
}];
private _getInManEhId = _unit getVariable [QGVAR(GetInManEhId), -1];
if (_getInManEhId != -1) then {
    _unit removeEventHandler ["Killed", _getInMan];
};
_getInManEhId = _unit addEventHandler ["GetInMan", {
    _this call FUNC(handleGetInMan);
}];
_unit setVariable [QGVAR(KilledEhId), _killedEhId, true];
_unit setVariable [QGVAR(GetInManEhId), _getInManEhId,true];


private _expl1 = createSimpleObject [QGVAR(Charge), [0,0,0]];
_expl1 attachTo [_unit, [-0.15, 0.12, 0.15], "Pelvis"];
private _yaw = 45; 
_pitch = -180; 
_roll = 90;
_expl1 setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

private _expl3 = createSimpleObject [QGVAR(Charge), [0,0,0]];
_expl3 attachTo [_unit, [0.15, 0.12, 0.15], "Pelvis"];
_yaw = 135; _pitch = -180; _roll = 90;
_expl3 setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

private _bombObj = QGVAR(Charge) createVehicle position _unit;
_bombObj attachTo [_unit , [0, 0.17, 0.15], "Pelvis"];
_yaw = 90; _pitch = -180; _roll = 90;
_bombObj setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
_box attachTo [_bombObj,[0,0,0]];

// set exact yaw, pitch, and roll
_yaw = 90; _pitch = 90; _roll = 0;
_box setVectorDirAndUp [
	[sin _yaw * cos _pitch, cos _yaw * cos _pitch, sin _pitch],
	[[sin _roll, -sin _pitch, cos _roll * cos _pitch], -_yaw] call BIS_fnc_rotateVector2D
];

private _distance = [GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt;
private _variation = _unit getVariable [QGVAR(charge_variation),5];
private _dud = _unit getVariable [QGVAR(charge_dud),0];
private _size = _unit getVariable [QGVAR(charge_size),0];

{
    _unit setVariable [_x,nil];
} forEach [QGVAR(charge_variation),QGVAR(charge_dud),QGVAR(charge_size)];

_bombObj setVariable [QGVAR(dist),_distance];
_bombObj setVariable [QGVAR(size), _size];
_bombObj setVariable [QGVAR(dud),_dud];
_bombObj setVariable [QGVAR(movable),true];
{
    _x addEventHandler ["Deleted", {(_this select 0) call FUNC(deleted)}];
} forEach [_unit, _bombObj];

if (_variation > 4) then {
	_variation = floor (random 5);
};


if (GVAR(isDetectable)) then {
    private _mine = QGVAR(Charge_Ammo) createVehicle [0,0,0];
    _mine attachTo [_bombObj, [0,0,0]];
    ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
    [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
};

private _wireSet = IEDD_CHARGE select _variation;

private _subObj0 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#0), [0,0,0]]; // 0 wire			
private _subObj1 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#1), [0,0,0]]; // 1 wire	
private _subObj2 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#2), [0,0,0]]; // 2 wire	
private _subObj3 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#3), [0,0,0]]; // 3 wire
private _subObj4 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#4), [0,0,0]]; // 4 wire
private _subObj5 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#5), [0,0,0]];	  // 5 wire (long)
private _subObj6 = createSimpleObject ["IEDD_WireCorner"+(_wireSet #0#6), [0,0,0]];	  // 6 (long)
private _wires = [_subObj0, _subObj1, _subObj2, _subObj3, _subObj4, _subObj5, _subObj6];

_subObjPosAndDir = [
	[[0.108,0.04,-0.01],[[1,0,0],[0.2,1,-4.3]]],  
	[[0.102,0.014,0.01],[[1,0,0],[0,1,-4.3]]],
	[[0.104,-0.003,0.01],[[1,0,0],[0,1,-4.3]]],
	[[0.109,-0.021,0.01],[[1,0.1,0],[-0.4,1,-44]]],
	[[0.105,-0.045,-0.01],[[1,0,0],[0,1,-25]]],
	[[0.120,0.066,0.04],[[-0,-0.642788,-0.766045],[0.34202,0.766045,-0.604023]]],
	[[0.120,-0.066,0.043],[[-0,-0.34202,-0.939693],[0,0.939693,-0.34202]]]
];

{
    _x attachTo [_bombObj,(_subObjPosAndDir select _forEachIndex) select 0];
    _x setVectorDirAndUp ((_subObjPosAndDir select _forEachIndex) select 1);
} forEach _wires;
{
    _x setVariable [QGVAR(text)," ("+localize LSTRING(Name_Short)+")",true];
} forEach [_subObj5, _subObj6];

_bombObj setVariable [QGVAR(wires), _wires,true];
_bombObj setVariable [QGVAR(bomb), true, true];
_bombObj setVariable [QGVAR(variation),_variation,true];

[
    {speed (_this select 0) == 0},
    {     
        params ["_bombObj", "_wireSet"];
        [QGVAR(disarmAction), [_bombObj]] call CBA_fnc_globalEventJIP;
        [QGVAR(defuseAction), [_bombObj, _wireSet]] call CBA_fnc_globalEventJIP; 
    },
    [_bombObj,_wireSet],
    1
] call CBA_fnc_waitUntilAndExecute;

true;
