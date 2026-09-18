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
class CfgGesturesMale {
    skeletonName = "OFP2_ManSkeleton";
    class Default;
    class States {
        class GVAR(base): Default {
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
            rightHandIKEnd = 1;
        };
        class GVAR(phone_in): GVAR(base) {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioin.rtm";
            speed = 0.5;
            interpolationRestart = 1;
            ConnectTo[] = {QGVAR(phone_loop), 0.001};
        };
        class GVAR(phone_loop): GVAR(base) {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioloop.rtm";
            speed = 0.05;
            mask = QGVAR(phoneBlend);
            ConnectTo[] = {QGVAR(phone_loop), 0.001};
            InterpolateTo[] = {QGVAR(phone_out), 0.001};
        };
        class GVAR(phone_noADS): GVAR(phone_loop) {
            enableOptics = 0;
        };
        class GVAR(phone_out): GVAR(base) {
            file = "a3\anims_f_epa\data\anim\sdr\cts\custom\a_in\acts_listeningtoradioout.rtm";
            speed = 0.5;
            minPlayTime = 1;
            mask = QGVAR(phoneBlend);
        };
        class GestureNod;
        class GVAR(stop): GestureNod {
            file = "a3\anims_f\data\anim\sdr\gst\gestureEmpty.rtm";
            disableWeapons = 0;
            disableWeaponsLong = 0;
            enableOptics = 1;
            mask = "empty";
        };
    };
    class BlendAnims {
        GVAR(phoneBlend)[] = {
            "Weapon", 0,
            "Pelvis", 0,
            "Spine", 0,
            "Spine1", 0,
            "Spine2", 0,
            "Spine3", 0,
            "Camera", 0,
            "launcher", 0,
            "weapon", 0,
            "launcher", 0,
            "neck", 0,
            "neck1", 0,
            "head", 0,
            "LeftShoulder", 1,
            "LeftArm", 1,
            "LeftArmRoll", 1,
            "LeftForeArm", 1,
            "LeftForeArmRoll", 1,
            "LeftHand", 1,
            "RightShoulder", 0,
            "RightArm", 0,
            "RightArmRoll", 0,
            "RightForeArm", 0,
            "RightForeArmRoll", 0,
            "RightHand", 0,
            "LeftUpLeg", 0,
            "LeftUpLegRoll", 0,
            "LeftLeg", 0,
            "LeftLegRoll", 0,
            "LeftFoot", 0,
            "LeftToeBase", 0,
            "RightUpLeg", 0,
            "RightUpLegRoll", 0,
            "RightLeg", 0,
            "RightLegRoll", 0,
            "RightFoot", 0,
            "RightToeBase", 0,
            "LeftHandIndex1", 1,
            "LeftHandIndex2", 1,
            "LeftHandIndex3", 1,
            "LeftHandMiddle1", 1,
            "LeftHandMiddle2", 1,
            "LeftHandMiddle3", 1,
            "LeftHandPinky1", 1,
            "LeftHandPinky2", 1,
            "LeftHandPinky3", 1,
            "LeftHandThumb1", 1,
            "LeftHandThumb2", 1,
            "LeftHandThumb3", 1,
            "RightHandIndex1", 0,
            "RightHandIndex2", 0,
            "RightHandIndex3", 0,
            "RightHandMiddle1", 0,
            "RightHandMiddle2", 0,
            "RightHandMiddle3", 0,
            "RightHandPinky1", 0,
            "RightHandPinky2", 0,
            "RightHandPinky3", 0,
            "RightHandThumb1", 0,
            "RightHandThumb2", 0,
            "RightHandThumb3", 0
       };
    };
};
