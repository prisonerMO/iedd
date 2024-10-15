#include "..\script_component.hpp"

private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
private _logic = _input param [0,objNull,[objNull]];
switch _mode do {
	// Default object init
	case "init": {
		if (is3DEN) exitWith {
            systemChat "EDEN";
            systemChat format ["%1, %2, %3, %4", _this, _mode, _input, _logic];
			systemChat format ["Synced: %1", synchronizedObjects _logic];
        };
		if (!isServer) exitWith {};
		_logic hideObject true;
		private _isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it is deactivated
		if (_isActivated) then {
            systemChat "EDEN";
            systemChat format ["%1, %2, %3, %4", _this, _mode, _input, _logic];
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
            systemChat format ["%1, %2, %3, %4", _this, _mode, _input, _logic];
			systemChat format ["Synced: %1", synchronizedObjects _logic];
		//["Changed %1",str(_logic)] call BIS_fnc_error;
	};

	// When object is being dragged
	case "dragged3DEN": {
		//["Dragged %1",str(_logic)] call BIS_fnc_error;
	};
};

true;
