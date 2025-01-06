#ifdef DISABLE_COMPILE_CACHE
    #define LINKFUNC(x) {_this call FUNC(x)}
    #define PREP_RECOMPILE_START    if (isNil "IEDD_PREP_RECOMPILE") then {IEDD_RECOMPILES = []; IEDD_PREP_RECOMPILE = {{call _x} forEach IEDD_RECOMPILES;}}; private _recomp = {
    #define PREP_RECOMPILE_END      }; call _recomp; IEDD_RECOMPILES pushBack _recomp;
#else
    #define LINKFUNC(x) FUNC(x)
    #define PREP_RECOMPILE_START ; /* disabled */
    #define PREP_RECOMPILE_END ; /* disabled */
#endif
/**
Enable debug cba settings
**/
// #define ENABLE_IEDD_DEBUG


/**
Enable TRACE()
**/

// #define DEBUG_ENABLED_EQUIPMENT
// #define DEBUG_ENABLED_IED
// #define DEBUG_ENABLED_MAIN
// #define DEBUG_ENABLED_MODELS
// #define DEBUG_ENABLED_MODULES
// #define DEBUG_ENABLED_NOTEBOOK
// #define DEBUG_ENABLED_VBIED