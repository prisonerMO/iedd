#include "..\script_component.hpp"
/*
 * Author: Prisoner
 * Set server side variables
 *
 * Arguments:
 * 1: IED <OBJECT>
 * 2: Bomb size <NUMBER>
 * 3: Dud chance <NUMBER>
 * 4: Timer value <NUMBER>
 * 5: Activation distance <NUMBER>
 * Return Value:
 * None
 *
 * Example:
 * call iedd_zeus_fnc_setIEDServer
 *
 * Public: No
 */
params ["_obj","_size","_dud","_timerValue","_dist"];
TRACE_1("IED Data:",_this);
_obj setVariable [EGVAR(ied,size),_size];
_obj setVariable [EGVAR(ied,dud),_dud];
_obj setVariable [EGVAR(ied,timerValue),_timerValue];
_obj setVariable [EGVAR(ied,dist),_dist];
call FUNC(setData);
