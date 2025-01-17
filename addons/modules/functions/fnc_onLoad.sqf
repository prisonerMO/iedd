
params ["_ctrl","_config"];
private _ocCtrls = allControls _ctrl select {"openClose" in (ctrlClassName _x)};
{
    _x ctrlSetTextColor [0, 0, 0, 0.5];
    _x ctrlSetBackgroundColor [0, 0, 0, 0.2];
    _x ctrlEnable false;
    //_x ctrlShow false;
} forEach _ocCtrls;

