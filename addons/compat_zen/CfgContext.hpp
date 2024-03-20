//class EditableObjects; 								#inheritance forZEN editable object menu
//class EditableObjects: EditableObjects { 				#Use in menu context
class zen_context_menu_actions {
	class GVAR(main) {
		displayName = ECSTRING(notebook,Action_Menu);
		icon = QPATHTOEF(models,preview\notebook.paa);
		condition = QUOTE(!isNull findDisplay 312);
		priority = 25;
		class GVAR(notebook) {
			icon = QPATHTOEF(models,preview\notebook.paa);
			displayName = ECSTRING(notebook,Action_Open);
			condition = "true";
			statement = QUOTE(createDialog QQGVAR(display));
		};
		class GVAR(activate) {
			displayName = ECSTRING(notebook,Action_Active);
			condition = QUOTE(call EFUNC(notebook,canActivate));
			statement = QUOTE(call EFUNC(notebook,activate));
		};
		class GVAR(explode) {
			displayName = ECSTRING(notebook,Action_Explode);
			condition = QUOTE(call EFUNC(notebook,canExplode));
			statement = QUOTE(call EFUNC(notebook,explode));
		};
	};
};
