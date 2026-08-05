/***NOT IN USE BECAUSE ATTACHED IED MOVES WHEN REMOVED ENTITY FROM EDITABLE OBJECTS***/
//#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Add an event handler to the entity created event to handle IEDs and other entities.
 *
 * Arguments:
 * 0: logic (OBJECT)

 * Return Value:
 * None
 *
 * Example:
 * [logic] call iedd_ied_fnc_handleEntityCreated;
 *
 * Public: No
 */
// params ["_logic"];
// TRACE_1("fnc_handleEntityCreated",_this);
// diag_log format ["IEDD: EntityCreated: %1", typeOf _logic];
// [{
// 	!isNull (_this select 0)
// },
// {
// 	params ["_logic"];
// 	diag_log format ["IEDD: EntityCreated: %1 and curator: %2", _logic, _curator];
// 	_logic addEventHandler ["CuratorObjectSelectionChanged", {
// 		params ["_curator", "_entity"];
// 		diag_log format ["IEDD: CuratorObjectSelectasfasfasfionChanged: curator: %1 and entity: %2", _curator, _entity];
// 		if (typeOf _entity == "iedd_ied_helper") then {
// 			_curator removeCuratorEditableObjects [[_entity]];
// 		};
// 	}];
// },[_logic]] call CBA_fnc_waitUntilAndExecute;


