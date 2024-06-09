// TRAININGJERRY
#include "script_component.hpp"
params ["_bombObj"];
_bombObj setVariable [QGVAR(training),true];
_bombObj setVariable [QGVAR(decals),false];
_bombObj call FUNC(jerry);
true;
