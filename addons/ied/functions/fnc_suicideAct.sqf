#include "script_component.hpp"
params ["_unit","_nearPlrs","_expDist","_actDist"];
diag_log format ["suicideAct: %1",_this];
_targetPlayer = selectRandom _nearPlrs;

//some motha fucking waypoint shit


//if (_actDist * 1.5 < _distance) exitWith (_unit call FUNC(suicide))
