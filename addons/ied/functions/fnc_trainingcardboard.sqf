// TRAININGCARDBOARD
#include "script_component.hpp"
params ["_bombObj"];
_bombObj setVariable [QGVAR(training),true];
_bombObj call FUNC(cardboard);
true;
