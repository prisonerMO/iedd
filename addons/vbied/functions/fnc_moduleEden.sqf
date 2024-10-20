#include "..\script_component.hpp"

private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
private _logic = _input param [0,objNull,[objNull]];
switch _mode do {
	// Default object init
	case "init": {
		if (is3DEN) exitWith {
            diag_log format ["EDEN INIT: %1, %2, %3, %4", _this, _mode, _input, _logic];
			diag_log format ["Synced: %1", synchronizedObjects _logic];
        };
		if (!isServer) exitWith {};
		_logic hideObject true;
		private _isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it is deactivated
		if (_isActivated) then {
            diag_log format ["MISSION INIT: %1, %2, %3, %4", _this, _mode, _input, _logic];
			private _syncedObjects = synchronizedObjects _logic;
			diag_log format ["Synced: %1", _syncedObjects];
			private _vehicle = _syncedObjects select 0;
			diag_log format ["Vehicle %1", _vehicle];
			private _type = getModelInfo _vehicle select 0;
			diag_log format ["Type %1", _type];
			private _index = VBIED_MODELS findIf {_type in _x};
			if (_index == -1) exitWith {
				systemChat "DELETE not allowed shit";
			};
			private _positions = GVAR(posAndDir) get _index;
			private _pos = _positions select 0; //_module get varible pos
			/*
				VARIATION
				size
				distances?
			*/
			//[_vehicle,_pos] call FUNC(setVbied);

		};
	};
	// When some attributes were changed (including position and rotation)
	case "attributesChanged3DEN": {

	};

	// When added to the world (e.g., after undoing and redoing creation)
	case "registeredToWorld3DEN": {
		//["registered %1",str(_logic)] call BIS_fnc_error;
	};

	// When removed from the world (i.e., by deletion or undoing creation)
	case "unregisteredFromWorld3DEN": {
		//["unregistered %1",str(_logic)] call BIS_fnc_error;
	};

	// When connection to object changes (i.e., new one is added or existing one removed)
	case "connectionChanged3DEN": {
		    systemChat "connectionChanged3DEN";
            diag_log format ["%1, %2, %3, %4", _this, _mode, _input, _logic];
			private _syncedObjects = ((get3DENConnections _logic select {_x select 0 == "Sync"}) apply {_x select 1});
			diag_log format ["SyncedObjects %1", _syncedObjects];
			private _vehicle = _syncedObjects select 0;
			diag_log format ["Vehicle %1", _vehicle];
			private _type = getModelInfo _vehicle select 0;
			diag_log format ["Type %1", _type];
			private _index = VBIED_MODELS findIf {_type in _x};
			if (_index == -1) then {
				systemChat "DELETE not allowed shit";
			};
		//["Changed %1",str(_logic)] call BIS_fnc_error;
	};

	// When object is being dragged
	case "dragged3DEN": {
		//["Dragged %1",str(_logic)] call BIS_fnc_error;
	};
};

true;
//["van_01_transport_f.p3d","a3\soft_f_gamma\van_01\van_01_transport_f.p3d",true,[0,0,-1.87164],2400.04]