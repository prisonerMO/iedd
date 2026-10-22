#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Prepares the data for the ieds.
 *
 * Arguments:
 * NONE
 *
 * Return Value:
 * HashMap of data
 *
 * Example:
 * call iedd_zeus_fnc_setData;
 *
 * Public: No
 */
 if (isNil QGVAR(data)) then {
    GVAR(data) = createHashMapFromArray [            
        ["variation",0],
        ["size",0],
        ["dud",0],
        ["dist",0],
        ["timer",0],
        ["timerValue",0],
        ["lidState",0],        
        ["openCloseEOD",0],
        ["openClose",0],
        ["color",0]
    ];
} else {
    {
        GVAR(data) set [_x,0]
    } forEach GVAR(data);
};

/***** NOT IN USE *****
params value <NUMBER>,changed <BOOLEAN>  
if (isNil QGVAR(data)) then {
    GVAR(data) = createHashMap;
    {
       GVAR(data) getOrDefaultCall [_x, {createHashMap}, true] merge [
        createHashMapFromArray [
            ["value",0],
            ["changed",false]
        ],true];
    } forEach [
        "variation",
        "size",
        "dud",
        "timer",
        "timerValue",
        "lidState",
        "openCloseEOD",
        "openClose",
        "color"
    ];
};
*/
