class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;
    class iedd_item_notebook: ACE_ItemCore {
        author = "prisoner";
        displayName = ECSTRING(main,Category_Main); //Item's Display Name
        picture = QPATHTOEF(models,preview\notebook.paa); //Displays icon in your Inventory
        model = QPATHTOEF(models,data\IEDD_notebook.p3d); //Path to your model
        icon = QPATHTOEF(models,preview\notebook.paa); //Leave as is "iconObject_circle"
        scope = 2;
        editorPreview =  QPATHTOEF(models,preview\notebook.paa);
        descriptionShort = CSTRING(descriptionShort); //Description displayed when mouse is hovered over item in inventory
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};


