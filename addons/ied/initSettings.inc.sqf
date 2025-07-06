
[
    QGVAR(isDuds),
    "CHECKBOX",
    [LSTRING(IsDuds), LSTRING(IsDuds_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTimeEOD),
    "TIME",
    [LSTRING(WireCutTimeEOD), LSTRING(WireCutTimeEOD_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 30, 5],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(wireCutTime),
    "TIME",
    [LSTRING(WireCutTime), LSTRING(WireCutTime_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 30, 10],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(plrCheck),
    "CHECKBOX",
    [LSTRING(PlrCheck), LSTRING(PlrCheck_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(vehCheck),
    "CHECKBOX",
    [LSTRING(VehCheck), LSTRING(VehCheck_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDetectable),
    "CHECKBOX",
    [LSTRING(IsDetectable), LSTRING(IsDetectable_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(minRange),
    "SLIDER",
    [LSTRING(MinRange), LSTRING(MinRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 20, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(maxRange),
    "SLIDER",
    [LSTRING(MaxRange), LSTRING(MaxRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [1, 20, 15, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChanceEOD),
    "SLIDER",
    [LSTRING(FailChanceEOD), LSTRING(FailChanceEOD_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.1, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failChance),
    "SLIDER",
    [LSTRING(FailChance), LSTRING(FailChance_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.25, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(failExploseChance),
    "SLIDER",
    [LSTRING(FailExploseChance), LSTRING(FailExploseChance_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.2, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(ignoreWireCutOrder),
    "CHECKBOX",
    [CSTRING(IgnoreWireCutOrder),CSTRING(IgnoreWireCutOrder_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isBlockedRange),
    "CHECKBOX",
    [LSTRING(IsBlockedRange), LSTRING(IsBlockedRange_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    false,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(defaultOpenCloseEOD),
    "SLIDER",
    [LSTRING(DefaultOpenCloseEOD), LSTRING(OpenCloseEOD_Description)],
	[localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.05, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(defaultOpenClose),
    "SLIDER",
    [LSTRING(DefaultOpenClose), LSTRING(OpenClose_Description)],
    [localize "STR_iedd_main_Category_Main","IEDs"],
    [0, 1, 0.30, 0, true],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(addNotebook),
    "CHECKBOX",
    [LSTRING(AddNotebook), LSTRING(AddNotebook_Description)],
    [localize "STR_iedd_main_Category_Main","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(addDefusalKit),
    "CHECKBOX",
    [LSTRING(AddDefusalKit), LSTRING(AddDefusalKit_Description)],
    [localize "STR_iedd_main_Category_Main","Items"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isEod),
    "CHECKBOX",
    [LSTRING(IsEod), LSTRING(IsEod_Description)],
    [localize "STR_iedd_main_Category_Main","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

[
    QGVAR(isDefusalKit),
    "CHECKBOX",
    [LSTRING(IsDefusalKit), LSTRING(IsDefusalKit_Description)],
    [localize "STR_iedd_main_Category_Main","Requirements"],
    true,
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;
/**SUICIDE */
[
    QGVAR(expMinRange),
    "SLIDER",
    [LSTRING(ExpMinRange), LSTRING(ExpMinRange_Description)],
    [localize "STR_iedd_main_Category_Main","Suicide Bomber"],
    [1, 50, 10, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(expMaxRange),
    "SLIDER",
    [LSTRING(ExpMaxRange), LSTRING(ExpMaxRange_Description)],
    [localize "STR_iedd_main_Category_Main","Suicide Bomber"],
    [1, 50, 20, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(actMinRange),
    "SLIDER",
    [LSTRING(ActMinRange), LSTRING(ActMinRange_Description)],
    [localize "STR_iedd_main_Category_Main","Suicide Bomber"],
    [1, 1000, 300, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(actMaxRange),
    "SLIDER",
    [LSTRING(ActMaxRange), LSTRING(ActMaxRange_Description)],
    [localize "STR_iedd_main_Category_Main","Suicide Bomber"],
    [1, 1000, 500, 0],
    1
] call CBA_fnc_addSetting;

[
    QGVAR(includeZeus),
    "CHECKBOX",
    [LSTRING(SidesZeus), LSTRING(SidesZeus_Description)],
    [localize "STR_iedd_main_Category_Main","Suicide Bomber"],
    false,
    true,
    {},
    false // Needs mission restart
] call CBA_fnc_addSetting;


/*** IED Default values ***/
/*IED Default Variation*/
[
    QGVAR(defaultVariation),
    "LIST",
    [LSTRING(DefaultVariation), LSTRING(DefaultVariation_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0,1,2,3,4,5,6],
        [LSTRING(Variation_1), LSTRING(Variation_2), LSTRING(Variation_3), LSTRING(Variation_4), LSTRING(Variation_5), LSTRING(Variation_X), LSTRING(Name_Random)],
        6
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*Variation X Spawn prob % if random selected*/
[
    QGVAR(defaultVarX),
    "SLIDER",
    [LSTRING(DefaultVarX), LSTRING(DefaultVarX_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [0, 1, 0, 0, true],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

/*IED Default Size*/
[
    QGVAR(defaultSize),
    "LIST",
    [LSTRING(DefaultSize), LSTRING(DefaultSize_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0,1,2,3,4,5],
        [CSTRING(Name_Tiny),CSTRING(Name_Small),CSTRING(Name_Medium),CSTRING(Name_Large),CSTRING(Name_Huge),CSTRING(Name_Random)],
        2
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Default Direction BOOLEAN*/
[
    QGVAR(defaultDirection),
    "LIST",
    [LSTRING(DefaultDirection), LSTRING(DefaultDirection_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [false, true],
        [LSTRING(Name_Disabled), LSTRING(Name_Enabled)],
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Default Decals BOOLEAN*/
[
    QGVAR(defaultDecals),
    "LIST",
    [LSTRING(DefaultDecals), LSTRING(DefaultDecals_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [false, true],
        [LSTRING(Name_Disabled), LSTRING(Name_Enabled)],
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Default Dud Prob %*/
[
    QGVAR(defaultDud),
    "SLIDER",
    [LSTRING(DefaultDud), LSTRING(DefaultDud_Description)],
	[localize "STR_iedd_main_Category_Main","IED Default Values"],
    [0, 1, 0.2, 0, true],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Default Fake Prob %*/
[
    QGVAR(defaultFake),
    "SLIDER",
    [LSTRING(DefaultFake), LSTRING(DefaultFake_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [0, 1, 0.25, 0, true],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Canister Default Color*/
[
    QGVAR(defaultColor),
    "LIST",
    [LSTRING(DefaultColor), LSTRING(DefaultColor_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        ["green","Blue","red","White","random"],
        [LSTRING(Name_Green), LSTRING(Name_Blue), LSTRING(Name_Red), LSTRING(Name_White), LSTRING(Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Timer Default BOOLEAN*/
[
    QGVAR(defaultTimer),
    "LIST",
    [LSTRING(Timer), LSTRING(DefaultTimer_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0, 1, 2],
        [LSTRING(Name_Disabled), LSTRING(Name_Enabled), LSTRING(Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart

] call CBA_fnc_addSetting;

/*IED Timer Countdown Time*/
[
    QGVAR(defaultTimerValue),
    "TIME",
    [LSTRING(TimerValue), LSTRING(DefaultTimerValue_Description)],
	[localize "STR_iedd_main_Category_Main","IED Default Values"],
    [1, 300, 120],
    2
] call CBA_fnc_addSetting;

/*IED Timer Is Actived BOOLEAN*/
[
    QGVAR(defaultRandomTimer),
    "LIST",
    [LSTRING(RandomTimer), LSTRING(DefaultRandomTimer_Description)],
    [localize "STR_iedd_main_Category_Main","IED Default Values"],
    [
        [0, 1, 2],
        [LSTRING(Name_Disabled), LSTRING(Name_Enabled), LSTRING(Name_Random)],
        0
    ],
    true,
    {},
    true // Needs mission restart
] call CBA_fnc_addSetting;

/*IED Timer Min Range*/
[
    QGVAR(defaultTimerMin),
    "TIME",
    [LSTRING(RandomTimerMin), LSTRING(DefaultTimerMin_Description)],
	[localize "STR_iedd_main_Category_Main","IED Default Values"],
    [1, 300, 60],
    2
] call CBA_fnc_addSetting;

/*IED Timer Max Range*/
[
    QGVAR(defaultTimerMax),
    "TIME",
    [LSTRING(RandomTimerMax), LSTRING(DefaultTimerMax_Description)],
	[localize "STR_iedd_main_Category_Main","IED Default Values"],
    [1, 300, 150],
    2
] call CBA_fnc_addSetting;

/*IEDD DEBUG*/
#ifdef ENABLE_IEDD_DEBUG
    [
        QEGVAR(equipment,debug),
        "CHECKBOX",
        [LSTRING(EquipmentDebug), LSTRING(EquipmentDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(ied,debug),
        "CHECKBOX",
        [LSTRING(IedDebug), LSTRING(IedDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(main,debug),
        "CHECKBOX",
        [LSTRING(MainDebug), LSTRING(MainDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(models,debug),
        "CHECKBOX",
        [LSTRING(ModelsDebug), LSTRING(ModelsDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(modules,debug),
        "CHECKBOX",
        [LSTRING(ModulesDebug), LSTRING(ModulesDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;

    [
        QEGVAR(notebook,debug),
        "CHECKBOX",
        [LSTRING(NotebookDebug), LSTRING(NotebookDebug_Description)],
        ["IEDD Notebook Dev","Debug"],
        false,
        true,
        {},
        true // Needs mission restart
    ] call CBA_fnc_addSetting;
#endif
