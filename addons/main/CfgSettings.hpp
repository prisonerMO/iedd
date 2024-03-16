class CfgSettings {
    class CBA {
        class Versioning {
            class iedd {
                class dependencies {
                    //ACE will hard exit if this is missing
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                    ace[] = {"ace_main", REQUIRED_ACE_VERSION, "(true)"};
                    //Warnings for missing RHS compat pbos
                    compat_zen[] = {"ace_compat_rhs_afrf3", {VERSION_AR}, "isClass (configFile >> 'CfgPatches' >> 'zen_main')"};
                };
            };
        };
    };
};
