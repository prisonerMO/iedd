#include "..\script_component.hpp"
/*
 * Author: IEDD
 * Returns the training IED types available for placement via the ZEN context menu.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Array of [Class Name <STRING>, Display Name <STRING>]
 *
 * Public: No
 */

[
    [QEGVAR(ied,Training_CanisterPlastic), ELSTRING(ied,Training_PlasticCanister_DisplayName)],
    [QEGVAR(ied,Training_CanisterFuel), ELSTRING(ied,Training_FuelCanister_DisplayName)],
    [QEGVAR(ied,Training_Cardboard), ELSTRING(ied,Training_Cardboard_DisplayName)],
    [QEGVAR(ied,Training_Cinder), ELSTRING(ied,Training_Cinder_DisplayName)],
    [QEGVAR(ied,Training_Barrel), ELSTRING(ied,Training_Barrel_DisplayName)],
    [QEGVAR(ied,Training_Barrel_Grey), ELSTRING(ied,Training_BarrelGrey_DisplayName)],
    [QEGVAR(ied,Training_Metal), ELSTRING(ied,Training_MetalBarrel_DisplayName)],
    [QEGVAR(ied,Training_Metal_English), ELSTRING(ied,Training_MetalBarrelEnglish_DisplayName)],
    [QEGVAR(ied,Training_Bucket), ELSTRING(ied,Training_Bucket_DisplayName)]
]
