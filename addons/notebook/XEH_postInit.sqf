#include "script_component.hpp"

if (!hasInterface) exitWith {};
["IEDD Notebook", QGVAR(openNotebook), [LELSTRING(main,Category_Main), LELSTRING(main,Category_Main)], {
    // Conditions: specific
    if (!isNull findDisplay 312) exitWith {
        createDialog QGVAR(display);
        true
    };
    if (call FUNC(canOpen)) exitWith {
        call FUNC(open);
        true
    };
    
    false
},
{false},
[208, [true, false, false]], true] call CBA_fnc_addKeybind;


[QGVAR(sound), {
    params ["_sound", "_source"];
        _source say3D _sound;
}] call CBA_fnc_addEventHandler;
