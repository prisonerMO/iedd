class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_SCRIPT(XEH_postInit));
        //clientInit = QUOTE(call COMPILE_SCRIPT(XEH_clientInit));
    };
};

class Extended_InitPost_EventHandlers {
    class GVAR(box) {
        class ADDON {
           deleted = QUOTE((_this select 0) call EFUNC(ied,deleted));
        };
    };
};
