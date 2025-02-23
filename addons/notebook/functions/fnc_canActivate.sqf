#include "..\script_component.hpp"
(curatorSelected select 0) findIf {typeOf _x in IEDD_CLASSES &&
_x getVariable [QEGVAR(ied,bomb),false]} > -1
