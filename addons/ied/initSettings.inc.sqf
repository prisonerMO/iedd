
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

/* IED Default values */
[
    QGVAR(defaultVariation), 
    "LIST",     
    [CSTRING(DefaultVariation),CSTRING(DefaultVariation_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0,1,2,3,4,5],
        [CSTRING(Variation_1),CSTRING(Variation_2),CSTRING(Variation_3),CSTRING(Variation_4),CSTRING(Variation_5),CSTRING(Name_Random)],
        5
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultSize), 
    "LIST",     
    [CSTRING(DefaultSize),CSTRING(DefaultSize_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0,1,2,3,4],
        [CSTRING(Name_Small),CSTRING(Name_Medium),CSTRING(Name_Large),CSTRING(Name_Huge),CSTRING(Name_Random)],
        2
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultDirection), 
    "LIST",     
    [CSTRING(DefaultDirection),CSTRING(DefaultDirection_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [false, true], 
        ["Disabled","Enabled"], 
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultDecals), 
    "LIST",     
    [CSTRING(DefaultDecals),CSTRING(DefaultDecals_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [false, true], 
        ["Disabled","Enabled"], 
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultFake),
    "SLIDER",
    [CSTRING(DefaultFake),CSTRING(DefaultFake_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [0, 1, 0.25, 0, true],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultDud),
    "SLIDER",
    [CSTRING(DefaultDud),CSTRING(DefaultDud_Description)],
	[localize "STR_iedd_main_Category_Main","IED Default Values"],
    [0, 1, 0.2, 0, true],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

[
    QGVAR(defaultColor), 
    "LIST",     
    [CSTRING(DefaultColor),CSTRING(DefaultColor_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        ["green","Blue","red","White","random"], 
        [CSTRING(Name_Green),CSTRING(Name_Blue),CSTRING(Name_Red),CSTRING(Name_White),CSTRING(Name_Random)],
        0
    ],
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