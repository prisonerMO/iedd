class CfgVehicles
{
    class ThingX;
    // Straigh
    class IEDD_WireStraight_Base : ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_SMALLWIRES";
        vehicleClass = "IEDD_SMALLWIRES";
        editorPreview = QPATHTOF(preview\straightred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Straight.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireStraightRed : IEDD_WireStraight_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\straightred.paa);
        displayName = CSTRING(Straight_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireStraightYellow : IEDD_WireStraightRed
    {
        editorPreview = QPATHTOF(preview\straightyellow.paa);
        displayName = CSTRING(Straight_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireStraightGreen : IEDD_WireStraightRed
    {
        editorPreview = QPATHTOF(preview\straightgreen.paa);
        displayName = CSTRING(Straight_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireStraightBlue : IEDD_WireStraightRed
    {
        editorPreview = QPATHTOF(preview\straightblue.paa);
        displayName = CSTRING(Straight_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireStraightBlack : IEDD_WireStraightRed
    {
        editorPreview = QPATHTOF(preview\straightblack.paa);
        displayName = CSTRING(Straight_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Thick_1
    class IEDD_WireThick1_Base:ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\singlered.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Thick1.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireThick1Red:IEDD_WireThick1_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\singlered.paa);
        displayName = CSTRING(Thick_1_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireThick1Yellow:IEDD_WireThick1Red
    {
        editorPreview = QPATHTOF(preview\singleyellow.paa);
        displayName = CSTRING(Thick_1_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireThick1Green:IEDD_WireThick1Red
    {
        editorPreview = QPATHTOF(preview\singlegreen.paa);
        displayName = CSTRING(Thick_1_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireThick1Blue:IEDD_WireThick1Red
    {
        editorPreview = QPATHTOF(preview\singleblue.paa);
        displayName = CSTRING(Thick_1_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireThick1Black:IEDD_WireThick1Red
    {
        editorPreview = QPATHTOF(preview\singleblack.paa);
        displayName = CSTRING(Thick_1_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Thick_2

    class IEDD_WireThick2_Base:ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\singlered.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Thick2.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireThick2Red:IEDD_WireThick2_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\singlered.paa);
        displayName = CSTRING(Thick_2_Red);
        hiddenSelectionsTextures[] =
        {
             QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireThick2Yellow:IEDD_WireThick2Red
    {
        editorPreview = QPATHTOF(preview\singleyellow.paa);
        displayName = CSTRING(Thick_2_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireThick2Green:IEDD_WireThick2Red
    {
        editorPreview = QPATHTOF(preview\singlegreen.paa);
        displayName = CSTRING(Thick_2_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireThick2Blue:IEDD_WireThick2Red
    {
        editorPreview = QPATHTOF(preview\singleblue.paa);
        displayName = CSTRING(Thick_2_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireThick2Black:IEDD_WireThick2Red
    {
        editorPreview = QPATHTOF(preview\singleblack.paa);
        displayName = CSTRING(Thick_2_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Thick_3

    class IEDD_WireThick3_Base:ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\singlered.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Thick3.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireThick3Red:IEDD_WireThick3_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\singlered.paa);
        displayName = CSTRING(Thick_3_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireThick3Yellow:IEDD_WireThick3Red
    {
        editorPreview = QPATHTOF(preview\singleyellow.paa);
        displayName = CSTRING(Thick_3_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireThick3Green:IEDD_WireThick3Red
    {
        editorPreview = QPATHTOF(preview\singlegreen.paa);
        displayName = CSTRING(Thick_3_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireThick3Blue:IEDD_WireThick3Red
    {
        editorPreview = QPATHTOF(preview\singleblue.paa);
        displayName = CSTRING(Thick_3_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireThick3Black:IEDD_WireThick3Red
    {
        editorPreview = QPATHTOF(preview\singleblack.paa);
        displayName = CSTRING(Thick_3_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Twist_1
    class IEDD_WireTwist1_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\twistred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Twist1.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireTwist1Red:IEDD_WireTwist1_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\twistred.paa);
        displayName = CSTRING(Twist_1_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireTwist1Yellow:IEDD_WireTwist1Red
    {
        editorPreview = QPATHTOF(preview\twistyellow.paa);
        displayName = CSTRING(Twist_1_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireTwist1Green:IEDD_WireTwist1Red
    {
        editorPreview = QPATHTOF(preview\twistgreen.paa);
        displayName = CSTRING(Twist_1_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireTwist1Blue:IEDD_WireTwist1Red
    {
        editorPreview = QPATHTOF(preview\twistblue.paa);
        displayName = CSTRING(Twist_1_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireTwist1Black:IEDD_WireTwist1Red
    {
        editorPreview = QPATHTOF(preview\twistblack.paa);
        displayName = CSTRING(Twist_1_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Twist_2
    class IEDD_WireTwist2_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\twistred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Twist2.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };

    };

    class IEDD_WireTwist2Red:IEDD_WireTwist2_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\twistred.paa);
        displayName = CSTRING(Twist_2_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireTwist2Yellow:IEDD_WireTwist2Red
    {
        editorPreview = QPATHTOF(preview\twistyellow.paa);
        displayName = CSTRING(Twist_2_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireTwist2Green:IEDD_WireTwist2Red
    {
        editorPreview = QPATHTOF(preview\twistgreen.paa);
        displayName = CSTRING(Twist_2_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireTwist2Blue:IEDD_WireTwist2Red
    {
        editorPreview = QPATHTOF(preview\twistblue.paa);
        displayName = CSTRING(Twist_2_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireTwist2Black:IEDD_WireTwist2Red
    {
        editorPreview = QPATHTOF(preview\twistblack.paa);
        displayName = CSTRING(Twist_2_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Twist_3
    class IEDD_WireTwist3_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\twistred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Twist3.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireTwist3Red:IEDD_WireTwist3_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\twistred.paa);
        displayName = CSTRING(Twist_3_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireTwist3Yellow:IEDD_WireTwist3Red
    {
        editorPreview = QPATHTOF(preview\twistyellow.paa);
        displayName = CSTRING(Twist_3_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireTwist3Green:IEDD_WireTwist3Red
    {
        editorPreview = QPATHTOF(preview\twistgreen.paa);
        displayName = CSTRING(Twist_3_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireTwist3Blue:IEDD_WireTwist3Red
    {
        editorPreview = QPATHTOF(preview\twistblue.paa);
        displayName = CSTRING(Twist_3_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireTwist3Black:IEDD_WireTwist3Red
    {
        editorPreview = QPATHTOF(preview\twistblack.paa);
        displayName = CSTRING(Twist_3_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // Twist_4
    class IEDD_WireTwist4_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_GROUNDWIRES";
        vehicleClass = "IEDD_GROUNDWIRES";
        editorPreview = QPATHTOF(preview\twistred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Twist4.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireTwist4Red:IEDD_WireTwist4_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\twistred.paa);
        displayName = CSTRING(Twist_4_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireTwist4Yellow:IEDD_WireTwist4Red
    {
        editorPreview = QPATHTOF(preview\twistyellow.paa);
        displayName = CSTRING(Twist_4_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireTwist4Green:IEDD_WireTwist4Red
    {
        editorPreview = QPATHTOF(preview\twistgreen.paa);
        displayName = CSTRING(Twist_4_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireTwist4Blue:IEDD_WireTwist4Red
    {
        editorPreview = QPATHTOF(preview\twistblue.paa);
        displayName = CSTRING(Twist_4_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireTwist4Black:IEDD_WireTwist4Red
    {
        editorPreview = QPATHTOF(preview\twistblack.paa);
        displayName = CSTRING(Twist_4_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };


    // Small
    class IEDD_WireSmall_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_SMALLWIRES";
        vehicleClass = "IEDD_SMALLWIRES";
        editorPreview = QPATHTOF(preview\smallred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Small.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireSmallRed:IEDD_WireSmall_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\smallred.paa);
        displayName = CSTRING(Small_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireSmallYellow:IEDD_WireSmallRed
    {
        editorPreview = QPATHTOF(preview\smallyellow.paa);
        displayName = CSTRING(Small_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireSmallGreen:IEDD_WireSmallRed
    {
        editorPreview = QPATHTOF(preview\smallgreen.paa);
        displayName = CSTRING(Small_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireSmallBlue:IEDD_WireSmallRed
    {
        editorPreview = QPATHTOF(preview\smallblue.paa);
        displayName = CSTRING(Small_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireSmallBlack:IEDD_WireSmallRed
    {
        editorPreview = QPATHTOF(preview\smallblack.paa);
        displayName = CSTRING(Small_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // L
    class IEDD_WireL_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_SMALLWIRES";
        vehicleClass = "IEDD_SMALLWIRES";
        editorPreview = QPATHTOF(preview\lred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_L.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireLRed:IEDD_WireL_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\lred.paa);
        displayName = CSTRING(L_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireLYellow:IEDD_WireLRed
    {
        editorPreview = QPATHTOF(preview\lyellow.paa);
        displayName = CSTRING(L_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireLGreen:IEDD_WireLRed
    {
        editorPreview = QPATHTOF(preview\lgreen.paa);
        displayName = CSTRING(L_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireLBlue:IEDD_WireLRed
    {
        editorPreview = QPATHTOF(preview\lblue.paa);
        displayName = CSTRING(L_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireLBlack:IEDD_WireLRed
    {
        editorPreview = QPATHTOF(preview\lblack.paa);
        displayName = CSTRING(L_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };
    // Corner
    class IEDD_WireCorner_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_SMALLWIRES";
        vehicleClass = "IEDD_SMALLWIRES";
        editorPreview = QPATHTOF(preview\cornerred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_Corner.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireCornerRed:IEDD_WireCorner_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\cornerred.paa);
        displayName = CSTRING(Corner_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireCornerYellow:IEDD_WireCornerRed
    {
        editorPreview = QPATHTOF(preview\corneryellow.paa);
        displayName = CSTRING(Corner_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireCornerGreen:IEDD_WireCornerRed
    {
        editorPreview = QPATHTOF(preview\cornergreen.paa);
        displayName = CSTRING(Corner_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireCornerBlue:IEDD_WireCornerRed
    {
        editorPreview = QPATHTOF(preview\cornerblue.paa);
        displayName = CSTRING(Corner_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireCornerBlack:IEDD_WireCornerRed
    {
        editorPreview = QPATHTOF(preview\cornerblack.paa);
        displayName = CSTRING(Corner_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };

    // C
    class IEDD_WireC_Base: ThingX
    {
        author = AUTHOR;
        scope = 0;
        scopecurator = 0;
        editorCategory = "IEDD_MAINCATEGORY";
        editorSubcategory = "IEDD_SMALLWIRES";
        vehicleClass = "IEDD_SMALLWIRES";
        editorPreview = QPATHTOF(preview\cred.paa);
        icon = "iconObject_10x1";
        model = QPATHTOF(data\IEDD_Wire_C.p3d);
        displayName = "";
        faction = "Empty";
        hiddenSelections[] = {"Component01"};
        hiddenSelectionsTextures[] =
        {
            ""
        };
    };

    class IEDD_WireCRed:IEDD_WireC_Base
    {
        scope = 2;
        scopeCurator = 2;
        editorPreview = QPATHTOF(preview\cred.paa);
        displayName = CSTRING(C_Red);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireRed_co.paa)
        };
    };

    class IEDD_WireCYellow:IEDD_WireCRed
    {
        editorPreview = QPATHTOF(preview\cyellow.paa);
        displayName = CSTRING(C_Yellow);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireYellow_co.paa)
        };
    };

    class IEDD_WireCGreen:IEDD_WireCRed
    {
        editorPreview = QPATHTOF(preview\cgreen.paa);
        displayName = CSTRING(C_Green);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireGreen_co.paa)
        };
    };

    class IEDD_WireCBlue:IEDD_WireCRed
    {
        editorPreview = QPATHTOF(preview\cblue.paa);
        displayName = CSTRING(C_Blue);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlue_co.paa)
        };
    };

    class IEDD_WireCBlack:IEDD_WireCRed
    {
        editorPreview = QPATHTOF(preview\cblack.paa);
        displayName = CSTRING(C_Black);
        hiddenSelectionsTextures[] =
        {
            QPATHTOF(textures\IED_WireBlack_co.paa)
        };
    };
};
