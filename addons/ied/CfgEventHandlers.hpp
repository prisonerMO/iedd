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
        //serverInit = QUOTE(call COMPILE_SCRIPT(XEH_serverPostInit));
    };
};


class Extended_InitPost_EventHandlers {
    class GVAR(CanisterPlastic) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(canister));
        };
    };
    class GVAR(CanisterFuel) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(jerry));
        };
    };
    class GVAR(Cardboard) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(cardboard));
        };
    };
    class GVAR(Cinder) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(cinder));
        };
    };
    class GVAR(Barrel) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(barrel));
        };
    };
    class GVAR(Barrel_Grey) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(barrel));
        };
    };
    class GVAR(Metal) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(metal));
        };
    };
    class GVAR(Metal_English) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(metal));
        };
    };

    class GVAR(Training_CanisterPlastic) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_CanisterFuel) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Cardboard) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Cinder) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Barrel) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Barrel_Grey) {
        class ADDON {
          serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Metal) {
        class ADDON {
           serverInit = QUOTE(_this call FUNC(training));
        };
    };
    class GVAR(Training_Metal_English) {
        class ADDON {
          serverInit = QUOTE(_this call FUNC(training));
        };
    };
};
