class CfgAmmo { 
	class DemoCharge_Remote_Ammo;
	class GVAR(Charge_Ammo):DemoCharge_Remote_Ammo {
		author = AUTHOR;
		scope = 1;
		mass = 0;
		displayName = CSTRING(Charge_Ammo_DisplayName);
	};
	class R_PG32V_F;
	class IEDD_TINY_AMMO: R_PG32V_F {
		author = AUTHOR;
		hit = 3;
		indirectHit = 2;
		indirectHitRange = 10;
	};
};
