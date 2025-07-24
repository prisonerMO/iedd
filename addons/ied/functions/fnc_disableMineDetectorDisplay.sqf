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
 * [_bombObj] call iedd_ied_fnc_disarmAction;
 *
 * Public: No
 */

if (!hasInterface) exitWith {};

params [
    ["_disabled", true, [true]],
    ["_unit", ACE_player, [objNull]]
 ];

_unit enableInfoPanelComponent ["left", "MineDetectorDisplay", !_disabled];
_unit enableInfoPanelComponent ["right", "MineDetectorDisplay", !_disabled];
