#include "..\script_component.hpp"
params ["_vehicle","_variation","_pos","_dir","_up","_dud","_size","_isTimer","_timerTime","_isRandom","_distance","_isGetIn","_isEngineOn","_isMove","_speed"];
TRACE_1("SetVbied",_this);
[{
	params ["_vehicle","_variation","_pos","_dir","_up","_dud","_size","_isTimer","_timerTime","_isRandom","_distance","_isGetIn","_isEngineOn","_isMove","_speed"];
	private _wireSet = VBIED_VARS select _variation;
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

	if (GVAR(isDetectable)) then {
		private _mine = QEGVAR(ied,Charge_Ammo) createVehicle [0,0,0];
		_mine attachTo [_box, [0,0,0]];
		private _jipId = ["ace_allowDefuse", [_mine,false]] call CBA_fnc_globalEventJIP;
		[_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
		_jipId = [QEGVAR(ied,hideObject), [_mine,true]] call CBA_fnc_globalEventJIP;
		[_jipID, _mine] call CBA_fnc_removeGlobalEventJIP;
	};	
	
	if (_isTimer) then {
		private _watch = createSimpleObject ["a3\Weapons_F\Ammo\mag_watch.p3d",[0,0,0]];
		_watch attachTo [_box, [0.03, -0.09, -0.0018]];
		_watch setVectorDirAndUp [[-0,-1,0],[0,0,1]];
		TRACE_2("Timer",_isTimer,_isRandom);
		private _time = if (_isRandom) then {
			private _min = round (_vehicle getVariable [QGVAR(randomTimerMin),GVAR(defaultTimerMin)]);
			private _max = round (_vehicle getVariable [QGVAR(randomTimerMax),GVAR(defaultTimerMax)]);
			TRACE_2("min/max",_min,_max);
			[_min, _max] call BIS_fnc_randomInt;
		} else {
			TRACE_1("Value",(_vehicle getVariable [ARR_2(QGVAR(timerValue),GVAR(defaultTimerValue))]));
			_timerTime
		};
		TRACE_1("time:",_time);
		_box setVariable [QEGVAR(ied,timerValue), _time];
		_box setVariable [QEGVAR(ied,timer),_isTimer,true];
	};
	
	if (_isMove) then {
		_box setVariable [QGVAR(speed), _speed];
	};
	_box setVariable [QGVAR(dist), _distance];
	_box setVariable [QGVAR(move), _isMove];
	_box setVariable [QEGVAR(ied,wires), _wires, true];
	_box setVariable [QEGVAR(ied,bomb), true, true];
	_box setVariable [QEGVAR(ied,size), _size];
	_box setVariable [QEGVAR(ied,dud), _dud];
	//Set defuseaction
	private _text = localize ELSTRING(Ied,Name_Long);
	private _jipId = [QEGVAR(ied,defuseAction), [_box, _wireSet,_text]] call CBA_fnc_globalEventJIP;
	[_jipID, _box] call CBA_fnc_removeGlobalEventJIP;
	//Set eventhandlers on vehicle
	if (_isGetIn) then {
		private _getInEhId = _vehicle addEventHandler ["GetIn", {
			params ["_vehicle", "_role", "_unit", "_turret"];
			if (isServer) then {
				call FUNC(handleGetIn);
			};
		}];
		_vehicle setVariable [QGVAR(getInEhId), _getInEhId];
	};
	//private _engineOn = _vehicle getVariable [QGVAR(engineOn),GVAR(defaultEngineOn)];
	if (_isEngineOn) then {
		private _engineOnEhId = _vehicle addEventHandler ["Engine", {
			params ["_vehicle", "_engineState"];
			if (isServer && _engineState) then {
				call FUNC(handleEngineOn);
			};
		}];
		_vehicle setVariable [QGVAR(engineOnEhId), _engineOnEhId];
	};

	/*Set explosion event on bomb object*/
	private _expEhId = _box addEventHandler ["Explosion", {
		call EFUNC(ied,explosion)
	}];
	_box setVariable [QGVAR(expEhId), _expEhId];

	/*Set eventhandler on delete*/
	_vehicle addEventHandler ["Deleted", {(_this select 0) call FUNC(deleted)}];
	/*update bomblist*/
	[QGVAR(updateBombList), [_box]] call CBA_fnc_serverEvent;

},_this, 0.1] call CBA_fnc_waitAndExecute;
