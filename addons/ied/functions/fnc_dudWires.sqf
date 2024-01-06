#include "script_component.hpp"
params ["_bombObj"];
private _ieddWires = _bombObj getVariable [QGVAR(wires),[]];
if (_ieddWires isEqualTo []) exitWith {};
private _type = typeOf _bombObj;
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
	diag_log format ["Unit %1 , alive unit %2", _unit, alive _unit];
	{
		if (!isNull _x) then  {
			_x attachTo [_bombObj,(IEDD_DUDS_CHARGE #_forEachIndex) #0];
			_x setVectorDirAndUp ((IEDD_DUDS_CHARGE #_forEachIndex) #1);
		};
	} forEach _ieddWires;
	if (!alive _unit) exitWith {
		_unit call FUNC(deleted);
	};
};