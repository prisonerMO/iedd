class GVAR(moduleBase): Module_F {
    author = AUTHOR;
    category = "IEDD";
    function = "ace_common_fnc_dummy";
    functionPriority = 1;
    isGlobal = 1;
    isTriggerActivated = 0;
    scopeCurator = 2;
};
class GVAR(ieds):GVAR(moduleBase) {
    category = QGVAR(ieds);
    curatorInfoType = QGVAR(RscIeds);
    displayName = CSTRING(Place_Ied);
    icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(decals):GVAR(ieds) {
    curatorInfoType = QGVAR(RscDecals);
    displayName = CSTRING(Signs);
};
class GVAR(activate):GVAR(moduleBase) {
    curatorCanAttach = 1;
    category = QGVAR(ieds);
    function = QFUNC(moduleActivate);
    displayName = CSTRING(Active);
    icon = QPATHTOF(UI\moduleicon.paa);
};
class GVAR(explode):GVAR(activate) {
    function = QFUNC(moduleExplode);
    displayName = CSTRING(Explode);
};

class GVAR(charge):GVAR(moduleBase) {
    curatorCanAttach = 1;
    category = QGVAR(ieds);
    displayName = CSTRING(Charge);
    icon = QPATHTOF(UI\moduleicon.paa);
    curatorInfoType = QGVAR(RscCharge);
};

class GVAR(suicide):GVAR(charge) {
    displayName = CSTRING(Suicide);
    curatorInfoType = QGVAR(RscSuicide);
};
/*Vbied modules*/
class GVAR(vbied):GVAR(charge) {
    curatorInfoType = QGVAR(RscVbied);
    displayName = CSTRING(Place_Vbied);
};

class GVAR(activateVbied):GVAR(activate) {
    function = QFUNC(activateVbied);
    displayName = CSTRING(Vbied_Activate);
};
class GVAR(explodeVbied):GVAR(activateVbied) {
    function = QFUNC(explodeVbied);
    displayName = CSTRING(Vbied_Explode);
};
//Test bury ied
class GVAR(BuryIED): GVAR(moduleBase) {    
    displayName = ECSTRING(ied,IsBury);
    category = QGVAR(ieds);
    curatorCanAttach = 1;
    curatorInfoType = QGVAR(RscBuryIED);
    icon = QPATHTOF(UI\moduleicon.paa);
};
