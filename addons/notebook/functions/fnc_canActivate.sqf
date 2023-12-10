#include "script_component.hpp"
(curatorSelected select 0) findIf {typeOf _x in IEDD_CLASSES && 
!isNil {_x getVariable QEGVAR(ied,bomb)}} != -1
