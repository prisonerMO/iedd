#include "script_component.hpp"

[
    "Object",
    [ECSTRING(ied,Dud),ECSTRING(iedd,Dud_Tooltip)],
    "zen_attributes_slider",
    [0, 1, 0.1, true],
    {
        [QGVAR(setData),[_entity,"dud",_value]] call CBA_fnc_serverEvent;
    },
    {
        [_entity,"dud"] call FUNC(getData);
    },
    {
        alive _entity && {typeOf _entity in IEDD_CLASSES}
    }
] call zen_attributes_fnc_addAttribute;

[
    "Object",
    [ECSTRING(ied,Size),ECSTRING(iedd,Size_Tooltip)],
    "zen_attributes_combo",
    [[
        [0, [ECSTRING(ied,Name_Small),"Change size to small"]],
        [1, [ECSTRING(ied,Name_Medium),"Change size to medium"]],
        [2, [ECSTRING(ied,Name_Large),"Change size to large"]],
        [3, [ECSTRING(ied,Name_Huge),"Change size to huge"]],
        [4, [ECSTRING(ied,Name_Random),"Change size to random, huge exluded"]]
    ]],
    {
        [QGVAR(setData),[_entity,"size",_value]] call CBA_fnc_serverEvent;
    },
    {
        [_entity,"size"] call FUNC(getData);
    },
    {
        alive _entity && {typeOf _entity in IEDD_CLASSES}
    }
] call zen_attributes_fnc_addAttribute;
