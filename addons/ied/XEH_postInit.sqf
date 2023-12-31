#include "script_component.hpp"

{
	[_x, "Explosion", {_this call FUNC(explosion)}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach IEDD_CLASSES;

[QGVAR(defuseAction), {
	params ["_bombObj", "_wireSet", "_wires", "_uncount", "_type"];
	if (isNull _bombObj) exitWith {};
	_this spawn {
		params ["_bombObj", "_wireSet", "_wires", "_uncount"];
		private _text = " (long)";
		private _r = [0,1,2,3,4,5,6] call BIS_fnc_arrayShuffle;
		for "_i" from 0 to 6 do {
			private _s = _r select _i;
			private _wire = _wires #_s;
			private _order = _wireSet #1 #_s;
			private _wireColor = if (_s < 5) then {
					_wireSet #0 #_s;
				} else {
					(_wireSet #0 #_s)+_text;
				};
			private _condition = {  
				params ["_target", "_player", "_actionParams"];
				_actionParams params ["_wire"];
				!isNull _wire;
			};
			private _statement = {    
				params ["_target", "_player", "_actionParams"];
				if (currentWeapon _player != "") then {
					[_player] spawn {
						params["_player"];
						[_player] call ace_weaponselect_fnc_putWeaponAway;
						sleep 1.7;
					};
				}; 
				private _cutTime = if ([_player] call ace_common_fnc_isEOD || _player getUnitTrait "explosiveSpecialist") then {GVAR(wireCutTimeEOD)} else {GVAR(wireCutTime)};
				[
					_cutTime,
					[_actionParams,_player],
					{                         
						params ["_actionParams","_player"];                              
						_this #0 #0 params ["_wire", "_wireColor", "_bombObj", "_order", "_uncount"];
						_this #0 #1 params ["_player"];
						[_player,_wire, _wireColor, _bombObj, _order, _uncount] call FUNC(cutWire);        
					},
					{
						params ["_actionParams","_player"];
					},
					"Working...",
					{true},
					["isNotSwimming"]
				] call ace_common_fnc_progressBar; 
			};
			private _iedSubAction = [_wireColor, "Cut " + toLower _wireColor, "", _statement, _condition,{},[_wire, _wireColor, _bombObj, _order, _uncount], "", 2,[false,false,false,false,false],{}] call ace_interact_menu_fnc_createAction;
			[_bombObj, 0, ["ACE_MainActions", "IEDD_DisarmMenu"], _iedSubAction] call ace_interact_menu_fnc_addActionToObject;
			sleep 0.1;
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(dudEffect), {
	params ["_bombObj"];
		_bombObj call FUNC(dudWires);
		[_bombObj] spawn {
		params ["_bombObj"];
		private _sound = format ["iedd_ied_dud%1", floor (random 4)];
		_bombObj say3D _sound;
		private _pos = _bombObj modelToWorld [0,0,0.4];
		private _ps1 = "#particlesource" createVehicle _pos;
		_ps1 setParticleParams [   
			["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard",   
			1, 1, [0, 0, 0], [0, 0, 0], 0, 1, 1, 3, [0.5,1.5],   
			[[1,1,1,0.4], [1,1,1,0.2], [1,1,1,0]],   
			[0.25,1], 1, 1, "", "", _ps1];   
		_ps1 setParticleRandom [0.2, [0.5, 0.5, 0.25], [0.125, 0.125, 0.125], 0.2, 0.2, [0, 0, 0, 0], 0, 0];  
		_ps1 setDropInterval 0.05;
		sleep 0.5;
		private _ps2 = "#particlesource" createVehicle _pos;
		_ps2 setParticleParams [   
			["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 16, 1], "", "Billboard",   
			5, 1.66, [0, 0, 0], [0, 0, 0], 0, 1.25, 1, 3, [0.5,1.5],   
			[[0, 0, 0, 0], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.05, 0.05, 0.05, 1], [0.1, 0.1, 0.1, 0.5], [0.125, 0.125, 0.125, 0]],  
			[0.25,1], 1, 1, "", "", _ps2];   
		_ps2 setParticleRandom [0.2, [0.05, 0.05, 0.05], [0.1, 0.1, 0.1], 0.2, 0.2, [0, 0, 0, 0], 0, 0];  
		_ps2 setDropInterval 0.5;
		sleep 0.2;
		deleteVehicle _ps1; 

		sleep 0.25;
		deleteVehicle _ps2;
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(sound), {
    params ["_sound", "_source"];
        _source say3D _sound;
}] call CBA_fnc_addEventHandler;

[QGVAR(decals),{
	_this call FUNC(decals);
}] call CBA_fnc_addEventHandler;

[QGVAR(explosion), {
	params ["_target"];
	_this call FUNC(bomb);
}] call CBA_fnc_addEventHandler;

[QGVAR(add), {
    params ["_unit","_item"];
	if !(_item in (items _unit)) then {
    	private _container = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
		private _index = _container findIf {_x canAdd _item};
		if (_index != -1) then {
			_container select _index addItemCargoGlobal [_item, 1];
		};
	};
}] call CBA_fnc_addEventHandler;

[QGVAR(hideObject), {
    params ["_object", "_value"];
		if (!isNull _object) then {
			_object hideObject _value;
		};        
}] call CBA_fnc_addEventHandler;

[QGVAR(updateBombList), {
	params ["_object"];
	[{!isNil QGVAR(bombs)}, {GVAR(bombs) pushBackUnique (_this select 0);}, [_object]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
	[{
		time > 10 && !isNil QGVAR(bombs)},		
	{
		INFO_1("Detect event called [Time: %1]",time);
		call FUNC(iedCheck);
	},
	[]] call CBA_fnc_waitUntilAndExecute;
};

if (!hasInterface) exitWith {};
["unit", {params ["_player"]; [_player] call FUNC(addItems);},true] call CBA_fnc_addPlayerEventHandler;