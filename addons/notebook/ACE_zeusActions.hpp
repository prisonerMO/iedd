class ACE_ZeusActions {
    class GVAR(zeus) {
        displayName = CSTRING(Action_Menu);
        icon = QPATHTOEF(models,preview\notebook.paa);
        condition = QUOTE(!isNull findDisplay 312);
        class GVAR(notebook) {
            displayName = CSTRING(Action_Open);
            condition = QUOTE(true);
            statement = QUOTE(createDialog QQGVAR(display));
        };
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
