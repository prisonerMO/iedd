class ace_zeus_moduleBase;
class GVAR(ieds):ace_zeus_moduleBase {
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	curatorInfoType = QGVAR(RcsIeds);
	displayName = CSTRING(Zeus_Place_Ied);
	icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(decals):GVAR(ieds) {
	curatorInfoType = QGVAR(RcsDecals);
	displayName = CSTRING(Zeus_Sign);
};
class GVAR(activate):ace_zeus_moduleBase {
	curatorCanAttach = 1;
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	function = QFUNC(moduleActivate);
	displayName = CSTRING(Zeus_Active);
	icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(explode):GVAR(activate) {
	function = QFUNC(moduleExplode);
	displayName = CSTRING(Zeus_Explode);
};

class GVAR(charge):ace_zeus_moduleBase {
	curatorCanAttach = 1;
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	displayName = CSTRING(Zeus_Charge);
	icon = QPATHTOF(UI\moduleicon.paa);
    curatorInfoType = QGVAR(RscCharge);
};

class GVAR(suicide):GVAR(charge) {
	displayName = CSTRING(Zeus_Suicide);
    curatorInfoType = QGVAR(RscSuicide);
};
/*Vbied modules
class GVAR(vbied):ace_zeus_moduleBase {
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	curatorInfoType = QGVAR(RcsVbied);
	displayName = CSTRING(Zeus_Place_Vbied);
	icon = QPATHTOF(UI\moduleicon.paa);
};
*/
/*
--> ACTIVE and EXPLODE (need maybe owns)
class GVAR(vbiedExp):GVAR(activate) {
	function = QFUNC(vbiedActivate);
	displayName = CSTRING(Zeus_Vbied_Activate);
};
class GVAR(vbiedExp):GVAR(activate) {
	function = QFUNC(vbiedExplode);
	displayName = CSTRING(Zeus_Vbied_Explode);
};
*/