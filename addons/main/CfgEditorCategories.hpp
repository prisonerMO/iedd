class CfgEditorCategories
{
    class IEDD_MAINCATEGORY // Category class, you point to it in editorCategory property
    {
        displayName = CSTRING(Category_Main); // Name visible in the list
    };
};
class CfgEditorSubcategories
{
    class IEDD_EQUIPMENT // Category class, you point to it in editorSubcategory property
    {
        displayName = CSTRING(Category_Equipment); // Name visible in the list
    };
    class IEDD_IEDS // Category class, you point to it in editorSubcategory property
    {
        displayName = CSTRING(Category_IEDs); // Name visible in the list
    };
    class IEDD_TRAINING_IEDS
    {
        displayName = CSTRING(Category_Training_IEDs);
    };
    class IEDD_ITEMS
    {
        displayName = CSTRING(Category_Items);
    };
    class IEDD_MODULES
    {
        displayName = CSTRING(Category_Modules);
    };
    class IEDD_MARKERS
    {
        displayName = CSTRING(Category_Markers);
    };
    class IEDD_GROUNDWIRES
    {
        displayName = CSTRING(Category_GroundWires);
    };
    class IEDD_SMALLWIRES
    {
        displayName = CSTRING(Category_SmallWires);
    };
    class IEDD_PARTS
    {
        displayName = CSTRING(Category_Parts);
    };
};
