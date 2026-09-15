class CfgSounds {

    class GVAR(wirecut0) 	{
        name = CSTRING(Sound_WireCut1);
        sound[] = {QPATHTOF(sounds\wirecut1.ogg),1, 1,100};
        titles[] = {0, ""};
    };

    class GVAR(dud0) {
        name = CSTRING(Sound_Dud0);
        sound[] = {QPATHTOF(sounds\shortcircuit1.ogg),1, 1,100};
        titles[] = {0, ""};
    };

    class GVAR(dud1) {
        name = CSTRING(Sound_Dud1);
        sound[] = {QPATHTOF(sounds\shortcircuit2.ogg),1, 1,100};
        titles[] = {0, ""};
    };

    class GVAR(dud2) {
        name = CSTRING(Sound_Dud2);
        sound[] = {QPATHTOF(sounds\shortcircuit3.ogg),1, 1,100};
        titles[] = {0, ""};
    };

    class GVAR(dud3) {
        name = CSTRING(Sound_Dud3);
        sound[] = {QPATHTOF(sounds\shortcircuit4.ogg),1, 1,100};
        titles[] = {0, ""};
    };
    class GVAR(peep1) {
        name = CSTRING(Sound_Peep1);
        sound[] = {QPATHTOF(sounds\peep1.ogg),1, 1,100};
        titles[] = {0, ""};
    };
    class GVAR(fail1) {
        name = CSTRING(Sound_Fail1);
        sound[] = {QPATHTOF(sounds\fail1.ogg),2, 1,100};
        titles[] = {0, ""};
    };
    class GVAR(fail2) {
        name = CSTRING(Sound_Fail2);
        sound[] = {QPATHTOF(sounds\fail2.ogg),2, 1,100};
        titles[] = {0, ""};
    };
};
class CfgSFX
{
    class GVAR(timer_SFX)
    {
        // { soundPath, soundVolume, soundPitch, maxDistance, probability, minDelay, midDelay, maxDelay }
        sounds[] = {QGVAR(Timer_Peep)};
        name = "TODO";
        GVAR(Timer_Peep)[] = {QPATHTOF(sounds\peep1.ogg), 0.45, 1.0, 25, 1, 0.896, 0.896, 0.896};
        empty[] = {"",0,0,0,0,0,0,0};
    };

    class GVAR(ring_SFX)
    {
        sounds[] = {QGVAR(Phone_Ring)};
        name = "TODO";
        GVAR(Phone_Ring)[] = {"\z\ace\addons\explosives\Data\Audio\Cellphone_Ring.wss", 1, 1.0, 25, 1, 0.896, 0.896, 0.896};
        empty[] = {"",0,0,0,0,0,0,0};
    };

    class GVAR(tone_SFX)
    {
        sounds[] = {QGVAR(Phone_DialTone)};
        name = "TODO";
        GVAR(Phone_DialTone)[] = {"\z\ace\addons\explosives\Data\Audio\DialTone.wss", 1, 1.0, 25, 1, 0.896, 0.896, 0.896};
        empty[] = {"",0,0,0,0,0,0,0};
    };
};
