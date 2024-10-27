#include "..\script_component.hpp"
params ["_vehicle","_activated"];
TRACE_1("Charge call",_this);
if (is3DEN) exitWith {};
if (!_activated) exitWith {TRACE_1("ExitWith _actived:",_activated)};
if (!isServer) exitWith {TRACE_1("ExitWith isServer:",isServer)};
[
    {!isNull (_this select 0)},
    {
		params ["_vehicle"];
        private _variation =_vehicle getVariable [QGVAR(variation),5];
        private _dud =_vehicle getVariable [QGVAR(dud),0];
        private _size =_vehicle getVariable [QGVAR(size),2];
		private _pos =_vehicle getVariable [QGVAR(pos),[0,0,0]];
		private _dir =_vehicle getVariable [QGVAR(dir),[0,0,0]];
		private _up =_vehicle getVariable [QGVAR(up),[0,0,0]];
		diag_log format ["ALL VARIABLES: %1", allVariables _vehicle select {_x find ["iedd_",0] == 0}];
		diag_log format ["SetVbied: _var: %1, _dud: %2, _size: %3",_variation, _dud, _size];
		diag_log format ["SetVbied: pos: %1, dir: %2, up: %3",_pos, _dir, _up ];

		/*Get wireset for VBIED*/
		private _wireSet = VBIED_VARS select _variation;

		private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
		//private _box = "Item_ChemicalDetector_01_watch_F" createVehicle [0,0,0];
		_box attachTo [_vehicle,_pos];
		_box setVectorDirAndUp [_dir,_up];

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
		/*
		private _isDistance = _bombObj getVariable [QGVAR(distance), 0];
    	private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    	_bombObj setVariable [QGVAR(dist),_distance]; //-> ied,dist --> if iedCheck used
		*/
		_bombObj setVariable [QGVAR(setup), createHashMapFromArray [["wires", _wires], ["variation", _variation], ["wireset", _wireSet]]];
    	_bombObj setVariable [QGVAR(bomb), true, true];

	},
    [_vehicle]
] call CBA_fnc_waitUntilAndExecute;