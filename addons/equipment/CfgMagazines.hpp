//Maybe not needed, but just in case
class CfgMagazines
{
    class CA_Magazine;    
    class iedd_Phone: CA_Magazine
    {
        author = AUTHOR;
        scope = 2;
        displayName = "IEDD Phone Magazine";
        descriptionShort = "IEDD Phone Magazine";
        model = "\A3\Structures_F\Items\Electronics\MobilePhone_old_F.p3d";
        picture = "\A3\Weapons_F\Data\UI\gear_MobilePhone_CA.paa";
        ammo = "GVAR(Phone_Ammo)";
        count = 1;
        mass = 1;
    };
};
