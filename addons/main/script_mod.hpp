#define MAINPREFIX x
#define PREFIX iedd

#include "script_version.hpp"

#define VERSION     MAJOR.MINOR
#define VERSION_STR MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR  MAJOR,MINOR,PATCHLVL,BUILD

// MINIMAL required version for the Mod. Components can specify others..
#define REQUIRED_VERSION 1.3
#define REQUIRED_CBA_VERSION {3,16,1}
#define REQUIRED_ACE_VERSION {3,16,1}