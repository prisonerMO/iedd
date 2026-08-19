if ("zen_main" call cba_fnc_isModLoaded) then {
    [
        QGVAR(zenContextMenuEnabled),
        "CHECKBOX",
        [LSTRING(ZenContextMenuEnabled), LSTRING(ZenContextMenuEnabled_Description)],
        [localize "STR_iedd_main_Category_Main", "Zeus Enhanced"],
        true,
        true,
        {},
        false
    ] call CBA_fnc_addSetting;
};

