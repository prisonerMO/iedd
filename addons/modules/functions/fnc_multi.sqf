#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Module function for IEDs and Fake IEDs
 *
 * Arguments:
 * 0: Mode <STRING>
 * 1: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["init",Logic] call iedd_modules_fnc_multi
 *
 * Public: No
 */

TRACE_1("fnc_multi",_this);

private _mode = param [0,"",[""]];
private _input = param [1,[],[[]]];
private _logic = _input param [0,objNull,[objNull]];
switch _mode do {
    // Default object init
    case "init": {
        if (is3DEN) exitWith {};
        if (!isServer) exitWith {};
        _logic hideObject true;
        private _isActivated = _input param [1,true,[true]]; // True when the module was activated, false when it is deactivated
        if (_isActivated) then {
            private _isRectangle = (_logic getVariable "objectarea") #3;
            private _size = [(_logic getVariable "objectarea") #0,(_logic getVariable "objectarea") #1];
            _size params ["_a","_b"];
            private _iedArea = if !(_isRectangle) then
                {
                    pi * _a/2 * _b/2;
                } else {
                    _a * _b;
                };
            if (_iedArea < 600) exitWith {
                ["IED Area cannot be under 600m2 %1",str(_logic)] call BIS_fnc_error;
            };
            private _iedTypes = IEDD_CLASSES select {_logic getVariable [_x,false] in [true, 1]};
            private _fakeTypes = IEDD_FAKE_CLASSES select {_logic getVariable [_x,false] in [true, 1]};
            private _iedCount = _logic getVariable [QGVAR(count),2];
            private _fakeCount = _logic getVariable [QGVAR(fakeCount),4];
            private _signs = _logic getVariable QGVAR(signs) in [true,1];
            private _extraSigns = _logic getVariable QGVAR(extraSigns) in [true,1];
            private _fakeSigns = _logic getVariable QGVAR(fakeSigns) in [true,1];
            private _extraCount = _logic getVariable [QGVAR(extraCount),0];
            private _dud = _logic getVariable [QGVAR(dud),0];
            sleep 0.05;
            //----BLACKLIST CHECK----
            private _getBlacklist = _logic getVariable [QGVAR(black),""];
            private _blacklist = if (_getBlacklist isEqualTo "") then {
                    [];
                } else {
                    _getBlacklist;
                };
            if (_blacklist isNotEqualTo []) then {
                _blacklist = [_blacklist, " ", ""] call CBA_fnc_replace;
                _blacklist = [_blacklist,","] call CBA_fnc_split;
                private _blTotal = 0;
                {
                    _sizeOf = markerSize _x;
                    _sizeOf params ["_c","_d"];
                    _areaOf = if (markerShape _x == "ELLIPSE") then
                    {
                        pi * _c/2 * _d/2;
                    } else {
                        _c * _d;
                    };
                    _blTotal = _blTotal + _areaOf;
                } forEach _blacklist;
                if  (_blTotal > _iedArea) exitWith {
                    ["Blacklist area(s) cannot be bigger than IED Area, %1",str(_logic)] call BIS_fnc_error;
                };
                _iedArea = _iedArea - _blTotal;
                _blacklist apply {_x setMarkerAlpha 0};
            };
            private _dump = sqrt(sqrt _iedArea);
            private _totalCount = round(_dump/4);
            sleep 0.05;
            //----IEDS----
            if  (_iedCount > _totalCount) exitWith {
                ["Max IEDs in area is %2, %1",str(_logic),_totalCount] call BIS_fnc_error;
            };
            private _distance =  round(_dump*4);
            private _position = getPosATL _logic;
            private _area = [_position, _a, _b, getDir _logic, _isRectangle];
            private _iedPositions = [];
            private _fakePositions = [];
            private _type = "";
            private _size = 0;
            private _bombObj = objNull;
            private _range = ((selectMax [_a,_b]) * 1.42)/2;
            private _allRoads = [];
            private _between = 0;
            private _bombPos = [0,0,0];
            private _road = objNull;
            private _roadPos = [0,0,0];
            private _decalType = "";
            if (_iedCount > 0) then {
                if (count _iedTypes == 0) exitWith {
                    ["None of types selected from IEDs, %1",str(_logic)] call BIS_fnc_error;
                };
                private _timerValue = _logic getVariable [QGVAR(timer), EGVAR(ied,defaultTimer)];
                //private _isTimer = if (_timerValue > 1) then {selectRandom [false,true]} else {[false,true] select _timerValue};
                for "_i" from 1 to _iedCount do {
                    _type = selectRandom _iedTypes;
                    if (_type == QEGVAR(ied,Metal)) then {
                        _type = selectRandom [QEGVAR(ied,Metal),QEGVAR(ied,Metal_English)];
                    };
                    if (_type == QEGVAR(ied,Barrel)) then {
                        _type = selectRandom [QEGVAR(ied,Barrel),QEGVAR(ied,Barrel_Grey)];
                    };
                    _bombPos = [[_area],_blacklist+["water"],{_iedPositions findIf {_this distance _x < _distance} == -1}] call BIS_fnc_randomPos;
                    _iedPositions pushBack _bombPos;
                    _between = _bombPos distance _position;
                    _road = [_bombPos, _range, _allRoads] call BIS_fnc_nearestRoad;
                    _allRoads pushBack _road;
                    _roadPos = getRoadInfo _road #6;
                    _nearBombs = _roadPos nearEntities [_iedTypes, _distance*2];
                    if (_nearBombs isNotEqualTo []) then {
                        _road = [_roadPos, _distance, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_blacklist findIf {_roadPos inArea _x} > -1) then {
                        _road = [_roadPos, _distance*2, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_roadPos isEqualTo [0,0,0]) then {
                        _bombPos = [[_area],_blacklist+["water"],{_iedPositions findIf {_this distance _x < _distance} == -1}] call BIS_fnc_randomPos;
                        _road = [_bombPos, _range, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_roadPos isEqualTo [0,0,0]) exitWith {};
                    private _iedPos = [_roadPos #0,_roadPos #1+(selectRandom [random [6,8,10], random [-6,-8,-10]]),0];
                    _bombObj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
                    _bombObj setPosATL _iedPos;
                    if (_type == QEGVAR(ied,CanisterFuel)) then {
                        _bombObj setVariable [QEGVAR(ied,color),"random"];
                    };
                    _size = selectRandom [0,1,2];
                    _bombObj setVariable [QEGVAR(ied,variation),6];
                    _bombObj setVariable [QEGVAR(ied,decals),_signs];
                    _bombObj setVariable [QEGVAR(ied,dir),true];
                    _bombObj setVariable [QEGVAR(ied,fake),0]; // Override CBA settings default value
                    _bombObj setVariable [QEGVAR(ied,timer),_timerValue]; // using CBA Defaults timer countdown time
                    _bombObj setVariable [QEGVAR(ied,dud),_dud];
                    _bombObj setVariable [QEGVAR(ied,size),_size];
                    if (_extraSigns) then {
                        private _decalPoses = [];
                        private _decalPos = [0,0];
                        for "_i" from 0 to 3 do {
                            _decalPos = [[[_bombObj, 80]], ["water"], { isOnRoad _this && _this distance _bombObj > 50 && {_decalPoses findIf {_this distance _x < 50} == -1}}] call BIS_fnc_randomPos;
                            _decalPoses pushBackUnique _decalPos;
                            if (_decalPos isEqualTo [0,0]) exitWith {};
                            [_decalPos] call EFUNC(ied,decals);
                        };
                    };
                    sleep 0.1;
                };
            };
            //----FAKE IEDS----
            if  (_fakeCount > _totalCount*10) exitWith {
                ["Max Fake IEDs in area is %2, %1",str(_logic),_totalCount] call BIS_fnc_error;
            };
            if (_fakeCount > 0) then {
                if (count _fakeTypes isEqualTo 0) exitWith {
                    ["None of types selected from Fake IEDs, %1",str(_logic)] call BIS_fnc_error;
                };
                private _color = "";
                for "_i" from 1 to _fakeCount do {
                    _type = selectRandom _fakeTypes;
                    if (_type == "Land_GarbageBarrel_01_F") then {
                        _type = selectRandom ["Land_GarbageBarrel_01_F","Land_GarbageBarrel_01_english_F"];
                    };
                    if (_type == "Land_BarrelEmpty_F") then {
                        _type = selectRandom ["Land_BarrelEmpty_F","Land_BarrelEmpty_grey_F"];
                    };
                    _bombPos = [[_area],_blacklist+["water"],{_fakePositions findIf {_this distance _x < _distance} == -1}] call BIS_fnc_randomPos;
                    _fakePositions pushBack _bombPos;
                    _between = _bombPos distance _position;
                    _road = [_bombPos, _range, _allRoads] call BIS_fnc_nearestRoad;
                    _allRoads pushBack _road;
                    _roadPos = getRoadInfo _road #6;
                    _nearBombs = _roadPos nearEntities [_iedTypes, _distance*2];
                    if (_nearBombs isNotEqualTo []) then {
                        _road = [_roadPos, _distance*2, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_blacklist findIf {_roadPos inArea _x} > -1) then {
                        _road = [_roadPos, _distance*2, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_roadPos isEqualTo [0,0,0]) then {
                        _bombPos = [[_area],_blacklist+["water"],{_fakePositions findIf {_this distance _x < _distance} == -1}] call BIS_fnc_randomPos;
                        _road = [_bombPos, _range, _allRoads] call BIS_fnc_nearestRoad;
                        _allRoads pushBack _road;
                        _roadPos = getRoadInfo _road #6;
                    };
                    if (_roadPos isEqualTo [0,0]) exitWith {};
                        private _fakePos = [_roadPos #0,_roadPos #1+(selectRandom [random [5,7,9], random [-5,-7,-9]]), 0];
                        _bombObj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
                        _bombObj setDir random 359;
                        _bombObj setPosATL _fakePos;
                    if (_type == "Land_CanisterFuel_F") then {
                        _color = selectRandom ["green", "Blue", "red", "White"];
                        if (_color != "green") then {
                            _bombObj setObjectTextureGlobal ["camo", "a3\Props_F_Orange\Humanitarian\Supplies\Data\canisterfuel_"+_color+"_co.paa"];
                        };
                    };
                    if (_fakeSigns) then {
                        [_bombObj] call EFUNC(ied,decals);
                    };
                    sleep 0.1;
                };
            };
            //----RANDOM DECALS----
            if (_extraCount > 0) then {
                private _signPositions = [[0,0,0]];
                private _signPos = [0,0];
                private _decal = objNull;
                for "_i" from 1 to _extraCount do {
                    _blaclistArea = _blacklist+["water"];
                    _signPos = [[_area],_blaclistArea, { isOnRoad _this && {_signPositions findIf {_this distance _x < 15} == -1}}] call BIS_fnc_randomPos;
                    _signPositions pushBackUnique _signPos;
                    if (_signPos isEqualTo [0,0]) then {
                        continue;
                    } else {
                        [_signPos] call EFUNC(ied,decals);
                    };
                    sleep 0.1;
                };
            };
        };
    };

    // When some attributes were changed (including position and rotation)
    case "attributesChanged3DEN": {

    };

    // When added to the world (e.g., after undoing and redoing creation)
    case "registeredToWorld3DEN": {
        //["registered %1",str(_logic)] call BIS_fnc_error;
    };

    // When removed from the world (i.e., by deletion or undoing creation)
    case "unregisteredFromWorld3DEN": {
        //["unregistered %1",str(_logic)] call BIS_fnc_error;
    };

    // When connection to object changes (i.e., new one is added or existing one removed)
    case "connectionChanged3DEN": {
        //["Changed %1",str(_logic)] call BIS_fnc_error;
    };

    // When object is being dragged
    case "dragged3DEN": {
        //["Dragged %1",str(_logic)] call BIS_fnc_error;
    };
};

true;
