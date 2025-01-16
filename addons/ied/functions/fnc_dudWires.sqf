#include "script_component.hpp"
params ["_bombObj"];
private _ieddWires = _bombObj getVariable [QGVAR(wires),[]];
if (_ieddWires isEqualTo []) exitWith {
	TRACE_1("No wires saved on object.",_bombObj);
	diag_log format ["No wires saved on object. %1",_bombObj];
};
private _type = typeOf _bombObj;
private _wires = switch (_type) do {
	case QGVAR(CanisterFuel): {IEDD_DUDS_JERRY};
	case QGVAR(CanisterPlastic): {IEDD_DUDS_CAN};
	case QGVAR(Cardboard): {IEDD_DUDS_CARDBOARD};
	case QGVAR(Cinder): {IEDD_DUDS_CINDER};
	case QGVAR(Metal): {IEDD_DUDS_METAL};
	case QGVAR(Metal_English): {IEDD_DUDS_METAL};
	case QGVAR(Barrel): {IEDD_DUDS_BARREL};
	case QGVAR(Barrel_Grey): {IEDD_DUDS_BARREL};
	case QGVAR(Charge): {IEDD_DUDS_CHARGE};	
	case QGVAR(Bucket): {IEDD_DUDS_VBIED};
	case QEGVAR(vbied,box): {IEDD_DUDS_VBIED};
	default {[]};
};
if (_wires isNotEqualTo []) then {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(_wires #_forEachIndex) #0];
			_x setVectorDirAndUp ((_wires #_forEachIndex) #1);
		};
	} forEach _ieddWires;
} else {
	diag_log format ["No defined dud positions to wires. %1",_bombObj];
	TRACE_1("No defined dud positions to wires.",_bombObj);
};
/*
if (_type == QGVAR(CanisterFuel)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_JERRY #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_JERRY #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(CanisterPlastic)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_CAN #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_CAN #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Cardboard)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_CARDBOARD #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_CARDBOARD #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Cinder)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_CINDER #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_CINDER #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Metal) || _type == QGVAR(Metal_English)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_METAL #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_METAL #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Barrel) || _type == QGVAR(Barrel_Grey)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_BARREL #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_BARREL #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Charge)) exitWith {
	private _unit = attachedTo _bombObj;
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_CHARGE #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_CHARGE #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QEGVAR(vbied,box)) exitWith {
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_VBIED #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_VBIED #_forEachIndex) #1);
		};
	} forEach _ieddWires;
};
if (_type == QGVAR(Bucket)) exitWith {
		{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_VBIED #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_VBIED #_forEachIndex) #1);
		};
	} forEach _ieddWires;
}
*/