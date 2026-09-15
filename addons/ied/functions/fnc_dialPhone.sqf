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
if (_unit getVariable [QGVAR(dialing), false]) exitWith {};
_unit call FUNC(startDial);

private _ied = GVAR(phoneIEDs) get _code;

if (!isNull _ied) then {
    private _iedTimes = _ied getVariable [QGVAR(phoneTimes), [GVAR(defaultPhoneTimeMin), GVAR(defaultPhoneTimeMax)]];
    _iedTimes params ["_callConnectTimeMin","_callConnectTimeMax"];
    private _random = ((ceil (random _callConnectTimeMax)) + _callConnectTimeMin);

    private _arr = [];
    for "_i" from 1 to _random do {
        _arr append [".", "..", "...", ""];
    };
    private _isPlayer = _unit == ACE_player;
    // UI is only open for player
    if (_isPlayer) then {
        ctrlSetText [96303, "Calling"];
    };

    
    private _ringTone = _ied getVariable [QGVAR(phoneRingtone), QGVAR(dialSound)];
    private _ringTonePos = getArray (configOf _ied >> QGVAR(phoneRingPos));
    private _ringSound = createSoundSource [_ringTone , [0,0,0], [], 0]; // starts ringtone
    _ringSound attachTo [_ied, _ringTonePos];

    private _dialTone = _ied getVariable [QGVAR(phoneRingtone), QGVAR(ringSound)];
    private _dialTonePos = _unit modelToWorldVisualWorld (_unit selectionPosition "RightHand");
    private _dialSound = createSoundSource [_dialTone , [0,0,0], [], 0]; // starts dialtone
    _dialSound attachTo [_unit, _dialTonePos];
    
    [{
        params ["_args", "_pfhID"];
        _args params ["_unit", "_isPlayer", "_dialStep", "_arr", "_ied", "_ringSound", "_dialSound"];

        private _isDialing = _unit getVariable [QGVAR(dialing), false];
        if (!_isDialing) exitWith {
            _pfhID call CBA_fnc_removePerFrameHandler;
            deleteVehicle _ringSound;
            deleteVehicle _dialSound;
        };

        // UI is only open for player
        if (_isPlayer) then {
            ctrlSetText [96303, format ["Calling%1", _arr select (_dialStep - 4)]];
        };
        // End call and detonate explosive
        if (_dialStep >= (count _arr + 2)) exitWith {
            _pfhID call CBA_fnc_removePerFrameHandler;

            if (!isNull _ied) then {
                [QGVAR(explosion), [_ied]] call CBA_fnc_serverEvent;
            };

            _unit call FUNC(endDial);
            // UI is only open for player
            deleteVehicle _dialSound;
            if (_isPlayer) then {
                ctrlSetText [96303, "Call Ended!"];
            };
        };
        //TO-DO: If player dies --> detach sound? phone? 
        _args set [2, _dialStep + 1];
    }, 0.25, [_unit, _isPlayer, 4, _arr, _ied, _ringSound, _dialSound]] call CBA_fnc_addPerFrameHandler;
};
nil
