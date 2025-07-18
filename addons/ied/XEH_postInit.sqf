#include "script_component.hpp"

{
    [_x, "Explosion", {call FUNC(explosion)}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach IEDD_BASE_CLASSES;

/*IED functions*/
[QGVAR(defuseAction), LINKFUNC(defuseAction)] call CBA_fnc_addEventHandler;
[QGVAR(detachAction), LINKFUNC(detachAction)] call CBA_fnc_addEventHandler;
[QGVAR(disarmAction), LINKFUNC(disarmAction)] call CBA_fnc_addEventHandler;
[QGVAR(dudEffect), LINKFUNC(dud)] call CBA_fnc_addEventHandler;
[QGVAR(decals), LINKFUNC(decals)] call CBA_fnc_addEventHandler;
[QGVAR(explosion), LINKFUNC(bomb)] call CBA_fnc_addEventHandler;
/*Suicide functions*/
[QGVAR(addPFH), LINKFUNC(addPFH)] call CBA_fnc_addEventHandler;
[QGVAR(suicideAct), LINKFUNC(suicide)] call CBA_fnc_addEventHandler;
[QGVAR(events), LINKFUNC(removeEvents)] call CBA_fnc_addEventHandler;

[QGVAR(timer), {
    params ["_object"];
    private _type = typeOf _object;
    private _timerObj = switch (_type) do {
        case QGVAR(Charge): {
            _object getVariable [QGVAR(unit),_object];
        };
        case QEGVAR(vbied,box): {
            attachedTo _object;
        };
        default {
            _object
        };
    };
    private _pos = _timerObj getVariable [QEGVAR(vbied,pos),[0,0,0]];
    private _time = _object getVariable [QGVAR(timerValue),GVAR(defaultTimerValue)];
    private _endTime = _time + time;
    private _sound = createSoundSource [QGVAR(timerSound) , [0,0,0], [], 0]; // starts alarm
    _sound attachTo [_timerObj,_pos];
    TRACE_1("Timer CBAevent:",_this);
    [_object,_endTime,_sound] call FUNC(timer);
}] call CBA_fnc_addEventHandler;

[QGVAR(add), {
    params ["_unit","_item"];
    if !(_item in (items _unit)) then {
        private _container = [uniformContainer _unit, vestContainer _unit, backpackContainer _unit];
        private _index = _container findIf {_x canAdd _item};
        if (_index > -1) then {
            _container select _index addItemCargoGlobal [_item, 1];
        };
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(hideObject), {
    params ["_object", "_value"];
        if (!isNull _object) then {
            _object hideObject _value;
        };
}] call CBA_fnc_addEventHandler;

[QGVAR(updateBombList), {
    params ["_object"];
    [{!isNil QGVAR(bombs)}, {GVAR(bombs) pushBackUnique (_this select 0);}, [_object]] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;

[QGVAR(detachCharges), {
    params ["_object"];
    private _attachedObjects = attachedObjects _object;
    private _index = _attachedObjects findIf {typeOf _x == QGVAR(Charge)};
    if (_index > -1) then {
        private _charges = _attachedObjects select {typeOf _x == QGVAR(Charge)};
        private _positions = [[-0.45,0.225,0.0],[0,0.45,0.0],[0.45,0.225,0.0]];
        private _pos = getPosATL _object;
        {
            private _charge = _x;
            deleteVehicle _charge;
            private _holder = createVehicle ["groundweaponholder", _pos, [], 0, "CAN_COLLIDE"];
            _holder addMagazineCargoGlobal  ["DemoCharge_Remote_Mag",1];
            _holder setPosWorld (_object modelToWorldWorld (_positions select _forEachIndex)); //TODO Pickup action for bombs.
            _memPos = getPosATL _holder;
            _holder setDir (random 359);
            _holder setPosATL [_memPos select 0, _memPos select 1, 0];
        } forEach _charges;
    };
    [_object] call FUNC(removeEvents);
}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
    params ["_unit", "_isUnconscious"];
    if (!local _unit) exitWith {};
    if (_isUnconscious) then {
        private _isSuicide = _unit getVariable [QGVAR(isSuicide),false];
        if (_isSuicide) then {
            call FUNC(handleUnconscious);
        };
    };
}] call CBA_fnc_addEventHandler;

["forceWalk", false, [QGVAR(charge)]] call ace_common_statusEffect_addType;

[QGVAR(defused), {
    params ["_unit", "_object"];
    TRACE_2("Defused: ",_unit,_object);
}] call CBA_fnc_addEventHandler;

[QGVAR(addLocal), {
    params ["_unit"];
    private _killedEhId = _unit getVariable [QGVAR(KilledEhId), -1];
    if (_killedEhId != -1) then {
        _unit removeEventHandler ["Killed", _killedEhId];
    };
    _killedEhId = _unit addEventHandler ["Killed", {
        TRACE_1("Called Killed",_this);
        call FUNC(handleKilled);
    }];
    _unit setVariable [QGVAR(KilledEhId), _killedEhId]; // need to be global? - NO
}] call CBA_fnc_addEventHandler;

//["ace_captiveStatusChanged", {call FUNC(handleHancuffed)}] call CBA_fnc_addEventHandler; //TODO ace isEscortin EH or this.

[QGVAR(suicide), {
    params ["_unit"];
    private _group = group _unit;
    private _side = side _group;
    if (_side != civilian) then {
        private _suicideGrp = createGroup [civilian, true];
        [_unit] joinSilent _suicideGrp;
    } else {
        if (count units _group > 1) then {
            [_unit] joinSilent [grpNull];
        };
    };
    {
        _unit disableAI _x;
    } forEach ["AUTOCOMBAT","COVER","FSM"];
    _unit setVariable [QGVAR(suicideSide),_side];
    call FUNC(suicide);
}] call CBA_fnc_addEventHandler;

if (isServer) then {

    [{
        time > 10 && !isNil QGVAR(bombs)},
    {
        INFO_1("IED detect event called [Time: %1]",time);
        call FUNC(iedCheck);
    },
    []] call CBA_fnc_waitUntilAndExecute;
};

if (!hasInterface) exitWith {};

["unit", {[ACE_player] call FUNC(addItems)},true] call CBA_fnc_addPlayerEventHandler;

[QGVAR(sound), {
    params ["_sound", "_source"];
    _source say3D _sound;
}] call CBA_fnc_addEventHandler;

GVAR(fail) = false;
