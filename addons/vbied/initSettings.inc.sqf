[
    QGVAR(plrCheck),
    "CHECKBOX",
    [LSTRING(PlrCheck), LSTRING(PlrCheck_Description)],
    [LSTRING(Main_Category),"VBIEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vehCheck),
    "CHECKBOX",
    [LSTRING(VehCheck), LSTRING(VehCheck_Description)],
    [LSTRING(Main_Category),"VBIEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDetectable),
    "CHECKBOX",
    [LSTRING(IsDetectable), LSTRING(IsDetectable_Description)],
    [LSTRING(Main_Category),"VBIEDs"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(minRange),
    "SLIDER",
    [LSTRING(MinRange), LSTRING(MinRange_Description)],
    [LSTRING(Main_Category),"VBIEDs"],
    [1, 20, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange),
    "SLIDER",
    [LSTRING(MaxRange), LSTRING(MaxRange_Description)],
    [LSTRING(Main_Category),"VBIEDs"],
    [1, 20, 15, 0],
    1
] call CBA_fnc_addSetting;

/*** VBIED Default values ***/
/*VBIED Default Variation*/
[
    QGVAR(defaultVariation),
    "LIST",
    [LSTRING(DefaultVariation), LSTRING(DefaultVariation_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0,1,2,3,4,5],
        [ELSTRING(ied,Variation_1), ELSTRING(ied,Variation_2), ELSTRING(ied,Variation_3), ELSTRING(ied,Variation_4), ELSTRING(ied,Variation_5), ELSTRING(ied,Name_Random)],
        5
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*VBIED Default Size*/
[
    QGVAR(defaultSize),
    "LIST",
    [LSTRING(DefaultSize), LSTRING(DefaultSize_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0,1,2,3,4,5],
        [ELSTRING(ied,Name_Tiny),ELSTRING(ied,Name_Small),ELSTRING(ied,Name_Medium),ELSTRING(ied,Name_Large),ELSTRING(ied,Name_Huge),ELSTRING(ied,Name_Random)],
        2
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*VBIED Default Dud Prob %*/
[
    QGVAR(defaultDud),
    "SLIDER",
    [LSTRING(DefaultDud), LSTRING(DefaultDud_Description)],
	[LSTRING(Main_Category),"VBIED Default Values"],
    [0, 1, 0.2, 0, true],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultSpeed),
    "SLIDER",
    [LSTRING(DefaultSpeed), LSTRING(DefaultSpeed_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [1, 150, 45, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultEngineOn),
    "LIST",
    [LSTRING(DefaultEngineOn), LSTRING(DefaultEngineOn_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0, 1, 2],
        [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled), ELSTRING(ied,Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(defaultGetIn),
    "LIST",
    [LSTRING(DefaultGetIn), LSTRING(DefaultGetIn_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0, 1, 2],
        [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled), ELSTRING(ied,Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(defaultMoving),
    "LIST",
    [LSTRING(DefaultMoving), LSTRING(DefaultMoving_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0, 1, 2],
        [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled), ELSTRING(ied,Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

//VBIED Timer Default BOOLEAN
[
    QGVAR(defaultTimer),
    "LIST",
    [ELSTRING(ied,Timer), ELSTRING(ied,DefaultTimer_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0, 1, 2],
        [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled), ELSTRING(ied,Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

//VBIED Timer Countdown Time
[
    QGVAR(defaultTimerValue),
    "TIME",
    [ELSTRING(ied,TimerValue), ELSTRING(ied,DefaultTimerValue_Description)],
	[LSTRING(Main_Category),"VBIED Default Values"],
    [1, 300, 120],
    2
] call CBA_fnc_addSetting;

//VBIED Timer Is Actived BOOLEAN
[
    QGVAR(defaultRandomTimer),
    "LIST",
    [ELSTRING(ied,RandomTimer), ELSTRING(ied,DefaultRandomTimer_Description)],
    [LSTRING(Main_Category),"VBIED Default Values"],
    [
        [0, 1, 2],
        [ELSTRING(ied,Name_Disabled), ELSTRING(ied,Name_Enabled), ELSTRING(ied,Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

//VBIED Timer Min Range
[
    QGVAR(defaultTimerMin),
    "TIME",
    [ELSTRING(ied,RandomTimerMin), ELSTRING(ied,DefaultTimerMin_Description)],
	[LSTRING(Main_Category),"VBIED Default Values"],
    [1, 300, 60],
    2
] call CBA_fnc_addSetting;

//VBIED Timer Max Range
[
    QGVAR(defaultTimerMax),
    "TIME",
    [ELSTRING(ied,RandomTimerMax), ELSTRING(ied,DefaultTimerMax_Description)],
	[LSTRING(Main_Category),"VBIED Default Values"],
    [1, 300, 150],
    2
] call CBA_fnc_addSetting;
