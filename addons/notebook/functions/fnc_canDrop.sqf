#include "script_component.hpp"
params ["_player"];
isTouchingGround _player &&
{isNull objectParent _player}