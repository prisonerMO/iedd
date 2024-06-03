class ace_zeus_moduleBase;
class GVAR(ieds):ace_zeus_moduleBase {
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	_generalMacro = QGVAR(ieds);
	curatorInfoType = QGVAR(RcsIeds);
	displayName = CSTRING(Zeus_Place_Ied);
	icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(trainingieds):GVAR(ieds) {
	_generalMacro = QGVAR(trainingieds);
	curatorInfoType = QGVAR(RcsTrainingIeds);
	displayName = CSTRING(Zeus_Place_Training_Ied);
};
class GVAR(decals):GVAR(ieds) {
	_generalMacro = QGVAR(decals);
	curatorInfoType = QGVAR(RcsDecals);
	displayName = CSTRING(Zeus_Sign);
};
class GVAR(activate):ace_zeus_moduleBase {
	curatorCanAttach = 1;
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	_generalMacro = QGVAR(activate);
	function = QFUNC(moduleActivate);
	displayName = CSTRING(Zeus_Active);
	icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(explode):GVAR(activate) {
	_generalMacro = QGVAR(explode);
	function = QFUNC(moduleExplode);
	displayName = CSTRING(Zeus_Explode);
};

class GVAR(charge):ace_zeus_moduleBase {
	curatorCanAttach = 1;
	scope = 1;
	scopecurator = 2;
	category = QGVAR(ieds);
	_generalMacro = QGVAR(charge);
	displayName = CSTRING(Zeus_Charge);
	icon = QPATHTOF(UI\moduleicon.paa);
    curatorInfoType = QGVAR(RscCharge);
};