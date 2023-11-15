class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class ACE_Equipment {
				class GVAR(actions) {
					displayName = CSTRING(Action_Menu);
					condition = QUOTE(call FUNC(canSelf));
					statement = "";
					icon = QPATHTOEF(models,preview\notebook.paa);
					class GVAR(open) { 
						condition = QUOTE(call FUNC(canOpen));
						displayName = CSTRING(Action_Open);
						statement = QUOTE(call FUNC(open));
						icon = "";
					};
					class GVAR(drop) { 
						condition = QUOTE(call FUNC(canDrop));
						displayName = CSTRING(Action_Drop);
						statement = QUOTE([ARR_2(_player,'iedd_item_notebook')] call FUNC(drop));
						icon = "";
					};
				};
			};
		};
	};
};
                
