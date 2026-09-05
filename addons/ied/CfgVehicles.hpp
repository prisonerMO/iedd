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
    class Helper_Base_F;
    class GVAR(helper): Helper_Base_F
    {
        author = AUTHOR;
        scope = 1;
        scopeCurator = 0;
        displayName = "IED Bury Helper";
        useAction = 0;
        ace_dragging_canDrag = 0;
		ace_dragging_canCarry = 0;
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "$STR_ace_interaction_MainAction";
                selection = "";
                distance = 2;
                condition = QUOTE(true);
                insertChildren = QUOTE(call FUNC(getDigActions));
            };
        };
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
    };
    class Items_base_F;
    class GVAR(Items_base): Items_base_F {
        class EventHandlers {
            class CBA_Extended_EventHandlers: CBA_Extended_EventHandlers {};
        };
        author = AUTHOR;        
        scope = 0;
        scopeCurator = 0;
        displayName = "IEDD Dummy Object";
        model = "\A3\Weapons_f\dummyweapon.p3d";
    };
    class GVAR(Phone): GVAR(Items_base) {
        author = AUTHOR;        
        scope = 2;
        scopeCurator = 2;
        displayName = "IEDD Phone Object";
        model = "\A3\Structures_F\Items\Electronics\MobilePhone_old_F.p3d";
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
