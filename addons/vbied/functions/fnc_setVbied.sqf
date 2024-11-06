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
        private _variation =_vehicle getVariable [QGVAR(variation),GVAR(defaultVariation)];
        private _dud =_vehicle getVariable [QGVAR(dud),GVAR(defaultDud)];
        private _size =_vehicle getVariable [QGVAR(size),GVAR(defaultSize)];
		private _pos =_vehicle getVariable [QGVAR(pos),[0,0,0]];
		private _dir =_vehicle getVariable [QGVAR(dir),[0,0,0]];
		private _up =_vehicle getVariable [QGVAR(up),[0,0,0]];
		diag_log format ["ALL VARIABLES: %1", allVariables _vehicle select {_x find ["iedd_",0] == 0}];
		diag_log format ["SetVbied: _var: %1, _dud: %2, _size: %3",_variation, _dud, _size];
		diag_log format ["SetVbied: pos: %1, dir: %2, up: %3",_pos, _dir, _up ];
		if (_variation == 5) then {
			_variation = selectRandom [0,1,2,3,4];
		};
		/*Get wireset for VBIED*/
		private _wireSet = VBIED_VARS select _variation;

		//private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
		private _box = QGVAR(box) createVehicle [0,0,0];
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

		private _subObjPosAndDir = [
			/* POS DIR UP*/
			[[0.045,0.003,-0.1],[[0,0,-1],[0,-1,0]]],//0
			[[0.021,0.003,-0.1],[[0.05,0,-1],[0,-1,0]]],//1
			[[0.003,0.003,-0.099],[[0,-0.4,-1],[0,-1,0]]],//2
			[[-0.027,0.01,-0.095],[[0,0,-1],[0.3,-1,0]]],//3
			[[-0.042,-0.002,-0.106],[[0,0,-1],[-0.2,-1,0]]],//4
			[[-0.05,-0.023,0.008],[[-1,0,0],[0,0,-1]]], //5
			[[0.05,-0.025,0.004],[[0.992,0,0.05],[-0.122,-0.024,-0.992]]] //6
		];

		{
			_x attachTo [_box,(_subObjPosAndDir select _forEachIndex) select 0];
			_x setVectorDirAndUp ((_subObjPosAndDir select _forEachIndex) select 1);
		} forEach _wires;
		
		private _isDistance = _vehicle getVariable [QGVAR(distance), 0];
    	private _distance = if (_isDistance > 0) then {_isDistance} else {[GVAR(minRange), GVAR(maxRange)] call BIS_fnc_randomInt};
    	_box setVariable [QGVAR(dist), _distance]; //-> vbied,dist --> if vbiedCheck used
		_box setVariable [QGVAR(wires), _wires,true];
		_box setVariable [QGVAR(bomb), true, true];
		/*
		if (GVAR(isDetectable)) then {
			private _mine = QGVAR(Charge_Ammo) createVehicle [0,0,0];
			_mine attachTo [_bombObj, [0,0,0]];
			private _jipId = ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
			[_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
			_jipId = [QGVAR(hideObject),[_mine,true]] call CBA_fnc_globalEventJIP;
			[_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
    	};		*/
		private _text = localize ELSTRING(Ied,Name_Long);
		private _jipId = [QEGVAR(ied,defuseAction), [_box, _wireSet,_text]] call CBA_fnc_globalEventJIP;
		[_jipID, _box] call CBA_fnc_removeGlobalEventJIP;

		//private _text = [localize ELSTRING(ied,Name_Long),localize ELSTRING(ied,Name_Short)] select (_variation > 2); //Text setup if want just text
		//private _holder = QGVAR(holder) createVehicle [0,0,0];
		//_holder attachTo [_box, [0,0,0]];
		//_holder setVariable [QGVAR(setup), createHashMapFromArray [["wires", _wires], ["variation", _variation], ["wireset", _wireSet], ["text", _text]],true];
    	//_holder setVariable [QGVAR(bomb), true, true];
		//_box setVariable [QGVAR(setup), createHashMapFromArray [["wires", _wires], ["variation", _variation], ["wireset", _wireSet], ["text", _text]],true];
    	//_box setVariable [QGVAR(bomb), true, true];

	},
    [_vehicle]
] call CBA_fnc_waitUntilAndExecute;