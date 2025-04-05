class CBA_Extended_EventHandlers;
class CfgVehicles {
    class Sound;
    class GVAR(timerSound): Sound // class name to be used with createSoundSource
    {
        author = AUTHOR;
        sound = QGVAR(timer_SFX); // reference to CfgSFX class
        displayName = "TODO";
        scope = 0;
    };
    #include "iedbarrel.hpp"
    #include "iedbucket.hpp"
    #include "iedcan.hpp"
    #include "iedcardboard.hpp"
    #include "iedcinder.hpp"
    #include "iedjerry.hpp"
    #include "iedmetal.hpp"
    #include "iedexplosives.hpp"
};
