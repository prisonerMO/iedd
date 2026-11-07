class ACE_ZeusActions {
    class EGVAR(notebook,zeus) {
        class GVAR(activate) {
            displayName = CSTRING(Action_Active);
            condition = QUOTE(call FUNC(canActivate));
            statement = QUOTE(call FUNC(activate));
        };
        class GVAR(explode) {
            displayName = CSTRING(Action_Explode);
            condition = QUOTE(call FUNC(canExplode));
            statement = QUOTE(call FUNC(explode));
        };
    };
};
