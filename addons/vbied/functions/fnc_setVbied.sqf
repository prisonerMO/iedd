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

		private _box  = createSimpleObject ["\a3\Weapons_F_Enoch\Items\ChemicalDetector_01_F.p3d", [0,0,0]];
		//private _box = "Item_ChemicalDetector_01_watch_F" createVehicle [0,0,0];
		_box attachTo [_vehicle,_pos];
		_box setVectorDirAndUp [_dir,_up];
	},
    [_vehicle]
] call CBA_fnc_waitUntilAndExecute;