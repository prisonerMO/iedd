#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Dials the number passed and detonates the explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT> (default: objNull)
 * 1: Code to dial <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "2131"] call iedd_ied_fnc_dialPhone
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_code", "", [""]]];
TRACE_2("params",_unit,_code);
systemChat format ["%1: %2", "iedd_ied_fnc_dialPhone", format ["Dialing %1 with code %2", name _unit, _code]];
if (!alive _unit || {!local _unit} || {_code == ""}) exitWith {};
if (isNil QGVAR(phoneIEDs) || {!(_code in GVAR(phoneIEDs))}) exitWith {};
if (_unit getVariable [QGVAR(dialing), false]) exitWith {}; //do we need this?

_unit setVariable [QGVAR(dialing), true, true];
//[["5546",[164073: ied_urban_big.p3d ACE_IEDUrbanBig_Command_Ammo,0.5]],["9189",[164080: ied_urban_big.p3d ACE_IEDUrbanBig_Command_Ammo,0.5]]]
private _ied = GVAR(phoneIEDs) get _code;

if (!isNull _ied) then {
    private _iedTimes = _ied getVariable [QGVAR(phoneTimes), [GVAR(defaultPhoneTimeMin), GVAR(defaultPhoneTimeMax)]];
    _iedTimes params ["_callConnectTimeMin","_callConnectTimeMax"];
    private _random = ((ceil (random _callConnectTimeMax)) + _callConnectTimeMin);

    private _arr = [];
    for "_i" from 1 to _random do {
        _arr append [".", "..", "...", ""];
    };

    private _ringtones = [];//getArray (_explosiveConfig >> QGVAR(ringtones)); to do random/ more ringtones

    private _ringtone = if (_ringtones isEqualTo []) then {
        ["\z\ace\addons\explosives\Data\Audio\Cellphone_Ring.wss", 0.75, 100, 1, 100] //to do own ringtone, volume, pitch, distance
    } else {
       selectRandom _ringtones;
    };
    _ringtone params ["_ringtonePath", "_ringtoneLength", ["_volume", 100], ["_soundPitch", 1], ["_distance", 100]];

    private _ringtoneDuration = (_ringtoneLength / 0.25);
    
    TRACE_6("ringtone",_ringtonePath,_ringtoneLength,_volume,_soundPitch,_distance,_ringtoneDuration);

// UI is only open for player
if (_unit == ACE_player) then {
    ctrlSetText [96303, "Calling"];
};

    [{
        params ["_args", "_pfhID"];
        _args params ["_unit", "_dialStep", "_arr", "_ied", "_explosiveObject", "_ringtoneDuration", "_ringtonePath", "_volume", "_soundPitch", "_distance"];

        if (_dialStep % 4 == 0) then {
            private _pos = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");
            playSound3D ["\z\ace\addons\explosives\Data\Audio\DialTone.wss", objNull, false, _pos, 100, 1, 100];  //to do own ringtone, volume, pitch, distance
        };

        // UI is only open for player
        if (_unit == ACE_player) then {
            ctrlSetText [96303, format ["Calling%1", _arr select (_dialStep - 4)]];
        };

        // End call and detonate explosive
        if (_dialStep >= (count _arr + 2)) exitWith {
            _pfhID call CBA_fnc_removePerFrameHandler;

            if (!isNull _ied) then {
                [QGVAR(explosion), [_ied]] call CBA_fnc_serverEvent;
            };

            _unit setVariable [QGVAR(dialing), nil, true];

            // UI is only open for player
            if (_unit == ACE_player) then {
                ctrlSetText [96303, "Call Ended!"];
            };
        };

        if (
            _dialStep == _ringtoneDuration &&
            {!isNull _ied}
        ) then {
            playSound3D [_ringtonePath, objNull, false, getPosASL _ied, _volume, _soundPitch, _distance];
        };

        _args set [1, _dialStep + 1];
    }, 0.25, [_unit, 4, _arr, _ied, _ied, _ringtoneDuration, _ringtonePath, _volume, _soundPitch, _distance]] call CBA_fnc_addPerFrameHandler;
};
nil
