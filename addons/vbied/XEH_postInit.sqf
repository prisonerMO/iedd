#include "script_component.hpp"

[QGVAR(detachBox), {
    params ["_box","_vehicle","_player"];
		detach _box;
		private _relpos = _player getRelPos [1, 0];
		private _newBox = createVehicle [QGVAR(box), _relpos, [], 0, "CAN_COLLIDE"];
		_newBox setPosATL _pos;
		_newBox setVectorDirAndUp [[0,0,1],[0,1,0]];
		//_box remove explosion event? or create dummy vehicle?
		//new position by using player, vehicle and box position TO-DO
}] call CBA_fnc_addEventHandler;

[QGVAR(updateBombList), {
	params ["_object"];
	[{!isNil QGVAR(bombs)}, {GVAR(bombs) pushBackUnique (_this select 0);}, [_object]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(events), {
	call FUNC(removeEvents);
}] call CBA_fnc_addEventHandler;

/* Server events*/
if (isServer) then {
	[{
		time > 1 && !isNil QGVAR(bombs)},
	{
		INFO_1("Detect event called [Time: %1]",time);
		call FUNC(vbiedCheck);
	},
	[]] call CBA_fnc_waitUntilAndExecute;
};
