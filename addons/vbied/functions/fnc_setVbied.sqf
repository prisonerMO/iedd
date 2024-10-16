#include "..\script_component.hpp"
params ["_veh","_pos"];
private _attachPos = _pos select 0; // can
private _dirAndUp = _pos select 1;
diag_log format ["setIED: this: %1",_this];
diag_log format ["AttachPos: %1, DirAndUp: %2",_attachPos,_dirAndUp];
