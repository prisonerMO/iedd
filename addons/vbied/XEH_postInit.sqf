#include "script_component.hpp"
/* Detach box event, not in use
[QGVAR(detachBox), {
    params ["_oldBox","_vehicle","_player"];
		detach _box;
		private _relpos = player getRelPos [1, 0];
		private _newBox = createVehicle [QGVAR(box), _relpos, [], 0, "CAN_COLLIDE"];
		_newBox setPosATL _pos;
		_newBox setVectorDirAndUp [[0,0,1],[0,1,0]];
		//_box remove explosion event? or create dummy vehicle?
}] call CBA_fnc_addEventHandler;
*/

/* Server events*/
if (isServer) then {
	[{
		time > 10 && !isNil QGVAR(bombs)},
	{
		INFO_1("Detect event called [Time: %1]",time);
		call FUNC(vbiedCheck);
	},
	[]] call CBA_fnc_waitUntilAndExecute;
};