class CfgMagazines
{
	class DemoCharge_Remote_Mag;
	class GVAR(mine_mag):DemoCharge_Remote_Mag
	{
		author = "prisoner";
		scope = 0;
		mass = 0;
		displayName = "iedd mag";
		picture = "\A3\Weapons_F\Data\UI\gear_c4_charge_small_CA.paa";
		model = "x\iedd\addons\models\data\IEDD_Wire_L.p3d";
		ammo = QGVAR(mine_ammo);
		descriptionShort = "iedd mag";
		class Library
		{
			libTextDesc = "Test";
		};
		allowedSlots[] = {901,701};
	};
};