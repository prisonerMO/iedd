class CfgMagazines
{
    class DemoCharge_Remote_Mag;
    class GVAR(Charge_Mag):DemoCharge_Remote_Mag
    {
        author = AUTHOR;
        scope = 1;
        mass = 0;
        displayName = CSTRING(Charge_Mag_DisplayName);
        picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
        ammo = QGVAR(Charge_Ammo);
        descriptionShort = CSTRING(Charge_Mag_Desc);
        class Library
        {
            libTextDesc = CSTRING(Charge_Mag_LibDesc);
        };
        allowedSlots[] = {901,701};
        descriptionUse = "";
        useAction = 0;
        useActionTitle = "";
    };
};