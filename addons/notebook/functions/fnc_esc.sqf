#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handle notebook display events
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["iedd_notebook_display"] call iedd_notebook_fnc_esc
 *
 * Public: No
 */

params ["_display"];
TRACE_1("fnc_esc",_this);

[QEGVAR(ied,sound), [QGVAR(open),player]] call CBA_fnc_globalEvent; // open
GVAR(animEH) = ace_player addEventHandler ["AnimChanged", {
    params ["_unit", "_anim"];
    if (_anim == "asswpercmrunsnonwnondf") then {
        private _display = uiNamespace getVariable 'iedd_display';
        _display displayRemoveEventHandler ["KeyDown",GVAR(escEH)];
        [QEGVAR(ied,sound), [QGVAR(close),player]] call CBA_fnc_globalEvent; // close sound
        ace_player removeEventHandler ["AnimChanged", GVAR(animEH)];
        closeDialog 1;
    };
}];

GVAR(escEH) =  (_this #0) displayAddEventHandler ['KeyDown', {
    params ["_display", "_key"];
    private _handled = false;
    if (_key == 1) then {
        [QEGVAR(ied,sound), [QGVAR(close),player]] call CBA_fnc_globalEvent; // close sound
        _display displayRemoveEventHandler ["KeyDown",GVAR(escEH)];
        ace_player removeEventHandler ["AnimChanged", GVAR(animEH)];
    };
    if (_key in (actionKeys 'ShowMap')) then {
        [QEGVAR(ied,sound), [QGVAR(close),player]] call CBA_fnc_globalEvent; // close sound
        closeDialog 1;
        openMap true;
        _display displayRemoveEventHandler ["KeyDown",GVAR(escEH)];
        ace_player removeEventHandler ["AnimChanged", GVAR(animEH)];
        _handled = true;
    };
    if (_key in (actionKeys 'nightVision')) then {
        if (hmd ace_player isNotEqualTo "") then {
            [QEGVAR(ied,sound), [QGVAR(close),player]] call CBA_fnc_globalEvent; // close sound
            closeDialog 1;
            ace_player action ["nvGoggles", ace_player];
            _display displayRemoveEventHandler ["KeyDown",GVAR(escEH)];
            ace_player removeEventHandler ["AnimChanged", GVAR(animEH)];
            _handled = true;
        };
    };
    _handled;
}];

if (isNil QGVAR(pages)) then {
    GVAR(pages) = createHashMap;
};
private _var = GVAR(pages) getOrDefault ["iedd_tab", "home", true];
private _current = GVAR(pages) getOrDefault [_var, 0, true];
[_var,_current] call FUNC(tabs);


