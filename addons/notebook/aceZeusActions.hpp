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
    };
};
