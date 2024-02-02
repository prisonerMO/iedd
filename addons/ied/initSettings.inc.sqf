
[
    QGVAR(isDuds),
    "CHECKBOX",	
    [CSTRING(IsDuds),CSTRING(IsDuds_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTimeEOD),
    "TIME",
    [CSTRING(WireCutTimeEOD),CSTRING(WireCutTimeEOD_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 30, 5],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTime),
    "TIME",
    [CSTRING(WireCutTime),CSTRING(WireCutTime_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 30, 10],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(plrCheck),
    "CHECKBOX",	
    [CSTRING(PlrCheck),CSTRING(PlrCheck_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vehCheck),
    "CHECKBOX",	
    [CSTRING(VehCheck),CSTRING(VehCheck_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDetectable),
    "CHECKBOX",	
    [CSTRING(IsDetectable),CSTRING(IsDetectable_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(minRange),
    "SLIDER",
    [CSTRING(MinRange),CSTRING(MinRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 20, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange),
    "SLIDER",
    [CSTRING(MaxRange),CSTRING(MaxRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 20, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChanceEOD),
    "SLIDER",
    [CSTRING(FailChanceEOD),CSTRING(FailChanceEOD_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.1, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChance),
    "SLIDER",
    [CSTRING(FailChance),CSTRING(FailChance_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.25, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failExploseChance),
    "SLIDER",
    [CSTRING(FailExploseChance),CSTRING(FailExploseChance_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.2, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(isBlockedRange),
    "CHECKBOX",	
    [CSTRING(IsBlockedRange),CSTRING(IsBlockedRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(addNotebook),
    "CHECKBOX",
    [CSTRING(AddNotebook),CSTRING(AddNotebook_Description)],
    [localize "STR_iedd_main_Category_Main","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(addDefusalKit),
    "CHECKBOX",
    [CSTRING(AddDefusalKit),CSTRING(AddDefusalKit_Description)],
    [localize "STR_iedd_main_Category_Main","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isEod),
    "CHECKBOX",
    [CSTRING(IsEod),CSTRING(IsEod_Description)],
    [localize "STR_iedd_main_Category_Main","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDefusalKit),
    "CHECKBOX",
    [CSTRING(IsDefusalKit),CSTRING(IsDefusalKit_Description)],
    [localize "STR_iedd_main_Category_Main","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;



#ifdef ENABLE_IEDD_DEBUG
    [
        QEGVAR(equipment,debug),
        "CHECKBOX",
        [CSTRING(EquipmentDebug),CSTRING(EquipmentDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(ied,debug),
        "CHECKBOX",
        [CSTRING(IedDebug),CSTRING(IedDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(main,debug),
        "CHECKBOX",
        [CSTRING(MainDebug),CSTRING(MainDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(models,debug),
        "CHECKBOX",
        [CSTRING(ModelsDebug),CSTRING(ModelsDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(modules,debug),
        "CHECKBOX",
        [CSTRING(ModulesDebug),CSTRING(ModulesDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(notebook,debug),
        "CHECKBOX",
        [CSTRING(NotebookDebug),CSTRING(NotebookDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;
#endif