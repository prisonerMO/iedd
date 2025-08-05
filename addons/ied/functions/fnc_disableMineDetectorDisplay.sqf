#include "..\script_component.hpp"
/*
 * Author: Zorn
 * Adds Function to enable/disable the side panel Mine Detector Radar
 *
 * Arguments:
 * 0: Disabled Radar <BOOL>
 * 1: Unit (optional - Default: ACE_player)<OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true, ACE_player] call iedd_ied_fnc_disableMineDetectorDisplay;
 *
 * Public: No
 */

params [
    ["_disabled", true, [true]],
    ["_unit", ACE_player, [objNull]]
 ];

TRACE_1(QGVAR(disableMineDetectorDisplay),_disabled);

if (!hasInterface) exitWith {
    TRACE_1(QGVAR(disableMineDetectorDisplay),"No interface available");
};
_unit enableInfoPanelComponent ["left", "MineDetectorDisplay", !_disabled];
_unit enableInfoPanelComponent ["right", "MineDetectorDisplay", !_disabled];
