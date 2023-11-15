
[
    QGVAR(isDuds),
    "CHECKBOX",	
    [CSTRING(IsDuds),CSTRING(IsDuds_Description)],
    ["IEDD Notebook","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTimeEOD),
    "TIME",
    [CSTRING(WireCutTimeEOD),CSTRING(WireCutTimeEOD_Description)],
	["IEDD Notebook","IEDs"],
    [1, 30, 5],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTime),
    "TIME",
    [CSTRING(WireCutTime),CSTRING(WireCutTime_Description)],
	["IEDD Notebook","IEDs"],
    [1, 30, 10],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(plrCheck),
    "CHECKBOX",	
    [CSTRING(PlrCheck),CSTRING(PlrCheck_Description)],
    ["IEDD Notebook","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vehCheck),
    "CHECKBOX",	
    [CSTRING(VehCheck),CSTRING(VehCheck_Description)],
    ["IEDD Notebook","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDetectable),
    "CHECKBOX",	
    [CSTRING(IsDetectable),CSTRING(IsDetectable_Description)],
    ["IEDD Notebook","IEDs"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(minRange),
    "SLIDER",
    [CSTRING(MinRange),CSTRING(MinRange_Description)],
    ["IEDD Notebook","IEDs"],
    [1, 20, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange),
    "SLIDER",
    [CSTRING(MaxRange),CSTRING(MaxRange_Description)],
    ["IEDD Notebook","IEDs"],
    [1, 20, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChanceEOD),
    "SLIDER",
    [CSTRING(FailChanceEOD),CSTRING(FailChanceEOD_Description)],
	["IEDD Notebook","IEDs"],
    [0, 1, 0.1, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChance),
    "SLIDER",
    [CSTRING(FailChance),CSTRING(FailChance_Description)],
    ["IEDD Notebook","IEDs"],
    [0, 1, 0.25, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failExploseChance),
    "SLIDER",
    [CSTRING(FailExploseChance),CSTRING(FailExploseChance_Description)],
	["IEDD Notebook","IEDs"],
    [0, 1, 0.2, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(isBlockedRange),
    "CHECKBOX",	
    [CSTRING(IsBlockedRange),CSTRING(IsBlockedRange_Description)],
    ["IEDD Notebook","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(addNotebook),
    "CHECKBOX",
    [CSTRING(AddNotebook),CSTRING(AddNotebook_Description)],
    ["IEDD Notebook","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(addDefusalKit),
    "CHECKBOX",
    [CSTRING(AddDefusalKit),CSTRING(AddDefusalKit_Description)],
    ["IEDD Notebook","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isEod),
    "CHECKBOX",
    [CSTRING(IsEod),CSTRING(IsEod_Description)],
    ["IEDD Notebook","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDefusalKit),
    "CHECKBOX",
    [CSTRING(IsDefusalKit),CSTRING(IsDefusalKit_Description)],
    ["IEDD Notebook","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

