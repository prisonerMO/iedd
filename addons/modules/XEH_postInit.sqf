#include "script_component.hpp"

[QGVAR(addBombVest), {
	call EFUNC(ied,charge);
}] call CBA_fnc_addEventHandler;

[QGVAR(remove), {
	params ["_unit"];
	TRACE_1("removeEvent",_this);
	removeAllWeapons _unit;
	private _vest = vest _unit;
	if (_vest != "") then {
        removeVest _unit;
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(createVbied),{
	params ["_vehicle","_data","_variation","_dud","_size","_timerValue","_timerTime","_isRandom","_distance","_getIn","_engineOn","_move","_speed"];
    _data params ["_pos","_dir","_up"];
    TRACE_1("VBIED Data:",_this);
    private _isTimer = if (_timerValue > 1) then {selectRandom [false,true]} else {[false,true] select _timerValue};
    private _isGetIn = if (_getIn > 1) then {selectRandom [false,true]} else {[false,true] select _getIn};
    private _isEngineOn = if (_engineOn > 1) then {selectRandom [false,true]} else {[false,true] select _engineOn};
    private _isMove = if (_move > 1) then {selectRandom [false,true]} else {[false,true] select _move};
    [_vehicle,_variation,_pos,_dir,_up,_dud,_size,_isTimer,_timerTime,_isRandom,_distance,_isGetIn,_isEngineOn,_isMove,_speed] call EFUNC(vbied,setVbied);
}] call CBA_fnc_addEventHandler;

[QGVAR(createIed), {
	params ["_type","_pos","_variation","_dud","_size","_timer","_value","_dist","_typeNum","_lidState","_oce","_oc"];
    TRACE_1("IED Data:",_this);
	private _bombObj = createVehicle [_type, _pos, [], 0, "CAN_COLLIDE"];
    _bombObj setVariable ["iedd_ied_variation",_variation];
    _bombObj setVariable ["iedd_ied_dud",_dud];
    _bombObj setVariable ["iedd_ied_size",_size];
    _bombObj setVariable ["iedd_ied_timer",_timer];
    _bombObj setVariable ["iedd_ied_timerValue",_value];
    _bombObj setVariable ["iedd_ied_distance",_dist];
    _bombObj setVariable ["iedd_ied_randomTimer",0]; //Override CBA settings default value
    _bombObj setVariable ["iedd_ied_fake",0]; //Override CBA settings default value
    _bombObj setVariable ["iedd_ied_decals",false]; //Override CBA settings default value
    if (_type == QEGVAR(ied,CanisterFuel)) then {
        private _color = ["green", "Blue", "red", "White"] select _typeNum-1;
        _bombObj setVariable ["iedd_ied_color",_color];
    };
    if (_type == QEGVAR(ied,Bucket)) then {
        _bombObj setVariable ["iedd_ied_lidState",_lidState];
        _bombObj setVariable ["iedd_ied_openCloseEOD",_oce];
        _bombObj setVariable ["iedd_ied_openClose",_oc];
    };
}] call CBA_fnc_addEventHandler;

[QGVAR(explode), {
	params ["_object"];
    if !(_object getVariable [QEGVAR(ied,bomb),false]) then {
        _object setVariable [QEGVAR(ied,bomb), true];
    };
    _object setVariable [QEGVAR(ied,dud),0];
	[QEGVAR(ied,explosion), [_object]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;
