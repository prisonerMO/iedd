class CfgMovesBasic {
    class ManActions {
        GVAR(phone_in) = QGVAR(phone_in);
        GVAR(phone_loop) = QGVAR(phone_loop);        
        GVAR(phone_loop_noADS) = QGVAR(phone_loop_noADS);
        GVAR(phone_out) = QGVAR(phone_out);
        GVAR(stop) = QGVAR(stop);
    };
    class Actions {
        class NoActions: ManActions {
            GVAR(phone_in)[] = {QGVAR(phone_in), "Gesture"};
            GVAR(phone_loop)[] = {QGVAR(phone_loop), "Gesture"};
            GVAR(phone_loop_noADS)[] = {QGVAR(phone_loop_noADS), "Gesture"};            
            GVAR(phone_out)[] = {QGVAR(phone_out), "Gesture"};
            GVAR(stop)[] = {QGVAR(stop), "Gesture"};
        };
    };
};

class CfgMovesMaleSdr : CfgMovesBasic // Override CfgMovesMaleSdr
{
    skeletonName="OFP2_ManSkeleton";
    gestures="CfgGesturesMale";
    class States
    {
        class Campaign_Base;
        class GVAR(base): Campaign_Base {
            disableWeapons = 0;
            disableWeaponsLong = 0;
            enableOptics = 1;
            limitGunMovement = 0;
            looped = 0;
            minPlayTime = 0.5;
            preload = 1;
            soundEnabled = 1;
            speed = 0.3;
            weaponLowered = 0;
            leftHandIKCurve[] = {0};
            rightHandIKBeg = 1;
            rightHandIKCurve[] = {1};
            mask = QGVAR(LeftArm);
        };          
        class GVAR(phone_in): Campaign_Base {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioin.rtm";
            speed = 0.5;
            interpolationRestart = 1;
            ConnectTo[] = {QGVAR(phone_loop), 0.001};
        };
        class GVAR(phone_loop): Campaign_Base {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioloop.rtm";
            looped = 1;
            speed = 0.5;
            ConnectTo[] = {QGVAR(phone_loop), 0.001};
            InterpolateTo[] = {QGVAR(phone_out), 0.001};
        };
        class GVAR(phone_out): Campaign_Base {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioout.rtm";
            speed = 0.5;
        };
        class GVAR(phone_loop_noADS): GVAR(phone_loop) {
            enableOptics = 0;
        };
    };
    class BlendAnims {
        GVAR(LeftArm)[] = {
            "LeftShoulder", 1,
            "LeftArm", 1,
            "LeftArmRoll", 1,
            "LeftForeArm", 1,
            "LeftForeArmRoll", 1,
            "LeftHand", 1,
            "LeftHandIndex1", 1,
            "LeftHandIndex2", 1,
            "LeftHandIndex3", 1,
            "LeftHandMiddle1", 1,
            "LeftHandMiddle2", 1,
            "LeftHandMiddle3", 1,
            "LeftHandPinky1", 1,
            "LeftHandMiddle2", 1,
            "LeftHandMiddle3", 1,
            "LeftHandPinky1", 1,
            "LeftHandPinky2", 1,
            "LeftHandPinky3", 1,
            "LeftHandRing", 1,
            "LeftHandRing1", 1,
            "LeftHandRing2", 1,
            "LeftHandRing3", 1,
            "LeftHandThumb1", 1,
            "LeftHandThumb2", 1,
            "LeftHandThumb3", 1
        };
    };
};
