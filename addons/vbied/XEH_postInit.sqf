#include "script_component.hpp"

[QGVAR(detachAction),LINKFUNC(detachAction)] call CBA_fnc_addEventHandler;

[QGVAR(detachBox), {
    params ["_box","_vehicle","_player"];
        detach _box;
        private _pos = _player getRelPos [0.6, 0];
        _box setPosATL _pos;
        _box setDir (random 360);
        _box setVectorDirAndUp [[0,0,-1],[0,1,0]];
        /* EVENT with collision -> remove collision with box and vehicle?
        [{
            //params ["_box","_vehicle","_player"];
            private _pos = _player getRelPos [0.6, 0];
            _box setPosATL _pos;
            _box setDir (random 360);
            _box setVectorDirAndUp [[0,0,-1],[0,1,0]];
        }, _this, 0.02] call CBA_fnc_waitAndExecute;
        */
}] call CBA_fnc_addEventHandler;

[QGVAR(updateBombList), {
    params ["_object"];
    [{!isNil QGVAR(bombs)}, {GVAR(bombs) pushBackUnique (_this select 0);}, [_object]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(events), LINKFUNC(removeEvents)] call CBA_fnc_addEventHandler;

/* Server events*/
if (isServer) then {
    [{
        time > 10 && !isNil QGVAR(bombs)},
    {
        INFO_1("VBIED detect event called [Time: %1]",time);
        call FUNC(vbiedCheck);
    },
    []] call CBA_fnc_waitUntilAndExecute;
};
