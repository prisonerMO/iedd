class CfgFactionClasses {
    class NO_CATEGORY;
    class GVAR(Modules): NO_CATEGORY {
        displayName = ECSTRING(main,Category_Main);
    };
    
    class GVAR(ieds) {
        displayName = ECSTRING(main,Category_Main);
        priority = 2;
		side = 7;
    };
};
