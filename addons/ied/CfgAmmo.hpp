class CfgAmmo { 
	class DemoCharge_Remote_Ammo;
	class SmokeShellRed;
	class R_PG32V_F;
	class GVAR(Charge_Ammo):DemoCharge_Remote_Ammo {
		author = AUTHOR;
		scope = 1;
		mass = 0;
		displayName = CSTRING(Charge_Ammo_DisplayName);
	};
	class GVAR(Training_IED_Ammo):SmokeShellRed {
		explosionTime=0.00001;
		timeToLive=4;
		SmokeShellSoundLoop1[]=
		{
			"x\iedd\addons\ied\sounds\whistle",
			100,
			1,
			15
		};
		grenadeBurningSound[]=
		{
			"SmokeShellSoundLoop1",
			1.0
		};
		/*
		*/
	};
	class IEDD_TINY_AMMO: R_PG32V_F {
		author = AUTHOR;
		hit = 3;
		indirectHit = 2;
		indirectHitRange = 10;
	};
};

