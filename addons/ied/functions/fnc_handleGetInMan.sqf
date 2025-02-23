#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Handles the GetInMan event for the bomb vest.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob] call iedd_ied_fnc_handleGetInMan
 *
 * Public: Yes
 */

params [];
TRACE_1("fnc_handleGetInMan",_this);


params ["_unit", "_role", "_vehicle", "_turret"];
TRACE_1("HandleGetInMan Bomb Vest",_unit);
// ensure event is only called once
private _idPFH = _unit getVariable [QGVAR(GetInManEhId),-1];
if (_idPFH != -1) then {
    [_idPFH] call CBA_fnc_removePerFrameHandler;
};
[{
    params ["_args", "_idPFH"];
    _args params ["_unit","_vehicle"];
    _unit setVariable [QGVAR(GetInManEhId),_idPFH];
    if (speed _vehicle > 45) then {
        private _attachedObjects = attachedObjects _unit;
        private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
        if (_index > -1) then {
            private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
            {
                private _charge = _x;
                private _isBomb = _charge getVariable [QGVAR(bomb),false];
                if (_isBomb) then {
                    [QGVAR(explosion), [_charge]] call CBA_fnc_serverEvent;
                };
            } forEach _charges;
        };
        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 1, [_unit,_vehicle]] call CBA_fnc_addPerFrameHandler;

private _getOutStatus = _unit getVariable [QGVAR(GetOutManEH), -1];
TRACE_2("GetOutManEH",_unit,_getOutStatus);
if (_getOutStatus == -1) then {
    private _getOutManEH = _unit addEventHandler ["GetOutMan", {
        params ["_unit", "_role", "_vehicle", "_turret", "_isEject"];
        TRACE_1("GetOutManEH Bomb Vest",_this);
        private _idPFH = _unit getVariable [QGVAR(GetInManEhId),-1];
        if (_idPFH != -1) then {
            [_idPFH] call CBA_fnc_removePerFrameHandler;
        };
        [_unit,false] call FUNC(hideCharges);
        _unit setVariable [QGVAR(hide),false];
        _unit setVariable [QGVAR(GetOutManEH), -1];
        _unit removeEventHandler [_thisEvent, _thisEventHandler];
    }];
    _unit setVariable [QGVAR(GetOutManEH), _getOutManEH];
};
[_unit,true] call FUNC(hideCharges);
_unit setVariable [QGVAR(hide),true];
