# AGENTS for IEDD Notebook

This file is meant to be a complete code-level guide for future contributors. The goal is that a developer can understand the project, recreate it, or extend it using only this file and the repository itself.

## 1. Project purpose

This repository is an Arma 3 mod that adds hidden improvised explosive devices (IEDs), bomb-disposal gameplay, a notebook field guide, editor/Zeus support, and vehicle-borne IED logic.

The project is not a mission pack or generic utility library. It is a gameplay mod centered around hazard recognition, defusal, damage risk, and tactical awareness.

At a high level, the design is:

- make mundane objects look harmless
- hide explosives inside those objects
- trigger detonation when players/vehicles get too close or move in the wrong way
- require specialist equipment and rules to disarm safely
- provide a notebook to identify and study bomb types
- optionally add VBIEDs, timers, fake bombs, dud bombs, training bombs, and Zeus tools

## 2. Dependency and build stack

The mod requires:
- Arma 3
- CBA A3
- ACE 3

Packaging/build tooling:
- HEMTT (`hemtt.toml`)
- mod prefix and version metadata in `addons/main/script_mod.hpp`

The build metadata is intentionally compact and uses CBA/ACE conventions rather than a custom build system.

## 3. Project structure

### `addons/main`
Base infrastructure used by every addon.
Contains:
- common macros
- version constants
- debug setup
- shared mod identity data

### `addons/ied`
Main gameplay system.
Contains the entire bomb logic and object definitions.
Key files:
- `config.cpp` — registers addon and required assets
- `CfgVehicles.hpp` — actual IED object types and ACE interactions
- `iedbarrel.hpp`, `iedbucket.hpp`, `iedcan.hpp`, `iedcardboard.hpp`, `iedcinder.hpp`, `iedjerry.hpp`, `iedmetal.hpp`, `iedexplosives.hpp` — per-type object definitions
- `script_macros_config.hpp` — config macros used across object attributes
- `XEH_postInit.sqf` — event registration and runtime bootstrapping
- `initSettings.inc.sqf` — CBA settings and gameplay tuning
- `functions/*.sqf` — actual logic implementation

### `addons/notebook`
Reference UI and player-facing guide.
Contains:
- notebook item behavior and actions
- keybind to open the notebook
- display layout for tabs and images
- image gallery of bomb-type references

Key files:
- `XEH_postInit.sqf`
- `Notebook.hpp`
- `CfgVehicles.hpp`
- `functions/fnc_canOpen.sqf`
- `functions/fnc_open.sqf`
- `functions/fnc_tabs.sqf`
- `functions/fnc_browse.sqf`

### `addons/modules`
Zeus/editor support and advanced placement tools.
Contains modules for:
- placing bombs
- activating bombs
- exploding bombs
- suicide bomber tools
- VBIED tools
- burying IEDs

Important files:
- `CfgVehicles.hpp`
- `zeusModules.hpp`
- `multimodule.hpp`

### `addons/vbied`
Vehicle-borne IED logic.
Contains:
- vehicle-attached hidden bombs
- various trigger conditions
- VBIED-specific config and defaults
- preset positions and attributes

### `addons/equipment`
Inventory item definitions and equipment allocation.
Contains notebook and defusal kit registration.

### `addons/models`
3D model assets for the mod’s objects and notch UI visuals.

## 4. Core gameplay loop

The gameplay loop is implemented in a few central scripts:

- `addons/ied/functions/fnc_iedCheck.sqf`
- `addons/ied/functions/fnc_cutWire.sqf`
- `addons/ied/functions/fnc_bomb.sqf`
- `addons/ied/functions/fnc_canDisarm.sqf`

The runtime flow is:

1. A disguised bomb object is placed or created.
2. The object gets internal state variables such as bomb armed status, wire set, timer flag, dud chance, variation, size, and activation distance.
3. A periodic server-side trigger check scans all active bombs.
4. If a player or vehicle is within range and moving too fast, the bomb triggers.
5. A player may interact with the bomb if they have the required equipment and skill.
6. The disarm process requires either a valid defusal action or wire-cut behavior.
7. The correct wire order leads to disarming.
8. Wrong wire order, or violation of the bomb’s rules, triggers explosion.
9. Bombs can be real, dud, or training, depending on settings.
10. VBIEDs and timed bombs add extra trigger layers.

## 5. Bomb identity and object model

The mod creates many classes that look like props but are actually armed objects.

Examples from `addons/ied/config.cpp`:
- `Barrel`, `Barrel_Fake`, `Barrel_Grey`
- `Bucket`, `Bucket_Fake`
- `CanisterPlastic`, `CanisterPlastic_Fake`
- `Cardboard`, `Cardboard_Fake`
- `Cinder`, `Cinder_Fake`
- `Metal`, `Metal_Fake`
- `Charge`
- `Training_*` variants

The pattern for each object is:
- there is a fake harmless visual object
- there is a real bomb object that extends that visual object
- the real object registers ACE actions and custom attributes
- the fake object is used as the default visual to disguise the bomb

This explains why the notebook and object classes match visually: the real object is still disguised as a common prop.

## 6. Hidden state and dynamic variables

The project uses object variables heavily. The logic is not centralized; it is attached to object instances and manipulated via scripts.

Examples of important variables:
- `QEGVAR(ied,bomb)` — bomb is armed
- `QEGVAR(ied,wires)` — wire objects associated with the bomb
- `QEGVAR(ied,timer)` — whether a timer is active
- `QEGVAR(ied,timerValue)` — timer duration
- `QEGVAR(ied,size)` — explosion size
- `QEGVAR(ied,dud)` — dud chance or state
- `QEGVAR(ied,variation)` — bomb variation pattern
- `QEGVAR(ied,dist)` — activation distance
- `QEGVAR(ied,move)` — movement-driven trigger
- `QEGVAR(ied,training)` — training-only behavior

These values are set in the config, object attributes, and script handlers, then read by the defusal and explosion systems.

## 7. Trigger detection

The key trigger logic is in:
- `addons/ied/functions/fnc_iedCheck.sqf`

This function runs repeatedly and inspects each active bomb in `GVAR(bombs)`.

It checks conditions such as:
- near-player distance threshold
- near-vehicle threshold
- vehicle speed over threshold
- player speed over threshold
- attached vehicle moving too fast
- static bomb movement or relocation

If triggered, it calls the explosion event.

This is the core of the “stealth IED” mechanic.

## 8. Defusal and wire cutting

### Equipment gate
`addons/ied/functions/fnc_canDisarm.sqf` checks if the player can actually attempt a defusal.
It verifies:
- EOD requirements if enabled
- explosive specialist trait if enabled
- defusal kit requirement if enabled

### Wire logic
`addons/ied/functions/fnc_cutWire.sqf` handles the actual wire cutting.
It:
- removes the cut wire object
- plays a wire-cut sound
- checks how many wires remain
- compares the cut order against the required sequence
- triggers explosion if wrong order is cut while order checking is active
- marks the bomb as defused once the full correct sequence is completed
- removes charged or attached bomb objects and triggers cleanup events

This is the actual tactical component: the player must identify the correct wire pattern and cut in order.

## 9. Explosion and dud handling

The main behavior for real explosions, duds, and training variants is in:
- `addons/ied/functions/fnc_bomb.sqf`

This function decides whether:
- it is a dud (non-lethal or fake effect)
- it is a training bomb (non-lethal, smoke or no real damage)
- it is a real bomb and should create a live explosive in position
- it should remove attached charge objects or cleanup the bomb object

The code controls whether the bomb becomes a dud or whether it triggers real explosive damage.

## 10. Notebook implementation

The notebook is a visual field guide for bomb recognition and safe defusal.

### UI structure
`addons/notebook/Notebook.hpp` defines the display and tabs. It creates controls like:
- previous arrow
- next arrow
- tabs for bomb categories
- the main image display area

### Page logic
The notebook is not a text encyclopedia; it is an image gallery.

It uses:
- `functions/fnc_tabs.sqf` to select a category such as `barrel`, `metal`, `cardboard`, `charge`, `vbied`, etc.
- `functions/fnc_browse.sqf` to move across numbered pages in that category

The folders under `addons/notebook/images/` hold the visual references. For example:
- `barrel/`
- `bucket/`
- `can/`
- `cinder/`
- `cardboard/`
- `charge/`
- `jerry/`
- `metal/`
- `vbied/`
- `about/`
- `home/`
- `info/`

The notebook pages show specific bomb shapes and likely wiring patterns. The gameplay logic is, in effect:
- look at the real object
- compare it to the notebook page
- identify the bomb type
- use that knowledge to know how to disarm it

This is a major gameplay design feature: the notebook adds recognition and learning, not just an item inventory entry.

## 11. Vehicle-borne IEDs

Vehicle logic lives in `addons/vbied`.

The central creation function is:
- `addons/vbied/functions/fnc_setVbied.sqf`

This function creates an attached bomb box to a vehicle and wires in:
- wire visualization
- timer visual
- detection object if enabled
- hidden bomb state
- defuse action
- GetIn / Engine / movement event handlers
- explosion event handler
- registration in the global bomb list

The notebook also has a `vbied` tab, confirming it is treated as a recognizable bomb category alongside the others.

## 12. Zeus/editor and module system

The project includes a curator/Zeus module system under `addons/modules`.

Defined in `addons/modules/CfgVehicles.hpp` and related files:
- `ieds` — place IEDs
- `decals` — ground signs / decals
- `activate` — activate selected IEDs
- `explode` — cause explosion
- `charge` — place charges
- `suicide` — suicide bomber module
- `vbied` — place VBIEDs
- `activateVbied`
- `explodeVbied`
- `BuryIED`

This means the project is designed not just for game mechanics but also for mission editing and scenario control.

## 13. Settings system

The mod uses CBA settings extensively.

Important settings files:
- `addons/ied/initSettings.inc.sqf`
- `addons/vbied/initSettings.inc.sqf`

These settings control:
- dud chance
- wire cut time
- fail chance
- activation range
- detection settings
- timer configuration
- bomb size defaults
- notebook / defusal kit auto-grant
- skill gating for EOD requirement
- suicide bomber parameters
- VBIED defaults and trigger rules

This indicates a game design where the mod is highly configurable and intended for custom missions and scenarios.

## 14. Event-driven architecture

The repo relies very heavily on CBA event handlers.

Key event patterns:
- `CBA_fnc_addEventHandler`
- `CBA_fnc_globalEvent`
- `CBA_fnc_serverEvent`
- `CBA_fnc_globalEventJIP`

Examples from `addons/ied/XEH_postInit.sqf`:
- `QGVAR(defuseAction)`
- `QGVAR(detachAction)`
- `QGVAR(disarmAction)`
- `QGVAR(dudEffect)`
- `QGVAR(decals)`
- `QGVAR(explosion)`
- `QGVAR(timer)`
- `QGVAR(addPFH)`
- `QGVAR(training)`

This is the “message bus” of the project. It allows the mod to keep logic modular while still being tightly connected to weapons, bombs, vehicles, UI, and Zeus operations.

## 15. Rebuild-from-scratch checklist

If another developer wanted to recreate this project from scratch, the minimum set of things to implement is:

1. Create a mod package with Arma/CBA/ACE structure.
2. Add shared macros and version metadata.
3. Define hidden bomb prop classes for each disguise type.
4. Create fake + real object pairs for every bomb style.
5. Attach ACE interaction and editor metadata.
6. Add a periodic bomb trigger system based on distance and movement.
7. Add defusal requirements and wire-order logic.
8. Implement `dud`, `training`, and real explosion outcomes.
9. Create a notebook item and a visual page gallery.
10. Add notebook UI, page browsing, and image tabs.
11. Add Zeus modules for placement and activation.
12. Add vehicle-borne bomb logic and timer integration.
13. Add settings and challenge tuning via CBA.
14. Ensure event flow and cleanup are handled correctly for both player and server contexts.

## 16. Important files to inspect first

If someone needs to understand the project quickly, this is the best read order:

1. `addons/ied/XEH_postInit.sqf`
2. `addons/ied/initSettings.inc.sqf`
3. `addons/ied/functions/fnc_iedCheck.sqf`
4. `addons/ied/functions/fnc_cutWire.sqf`
5. `addons/ied/functions/fnc_bomb.sqf`
6. `addons/ied/CfgVehicles.hpp`
7. `addons/notebook/XEH_postInit.sqf`
8. `addons/notebook/Notebook.hpp`
9. `addons/notebook/functions/fnc_tabs.sqf`
10. `addons/notebook/functions/fnc_browse.sqf`
11. `addons/vbied/functions/fnc_setVbied.sqf`
12. `addons/modules/CfgVehicles.hpp`
13. `hemtt.toml`
14. `addons/main/script_mod.hpp`

## 17. Known gaps and open questions

These are the remaining uncertain areas after code review:

- exact page-by-page notebook content beyond the visual gallery structure
- remaining Zeus module semantics beyond obvious activation and explosion functions
- full mission-authoring workflow and runtime validation steps in a real game environment
- exact balance defaults for all IED timer and trigger settings without mission testing
- deeper details of special cases like training bombs, fake bombs, and nonstandard explosion flows

These are not contradictions; they are just areas where runtime validation would improve confidence.

## 18. Final summary

This project is a fully modular Arma 3 IED / bomb-disposal mod.

The real gameplay is:
- create or place hidden explosive devices in ordinary objects
- detect them or learn about them via the notebook
- avoid triggering them while moving nearby
- use the right equipment and specialist rules
- cut the correct wires in the right order
- survive or trigger the appropriate dud/training/detonation behavior
- optionally use VBIED logic and Zeus/editor tools for advanced scenarios

The project’s architecture is object-state-driven, event-driven, and config-heavy. Anyone trying to recreate it should focus on hidden bomb objects, trigger loops, defusal order logic, the notebook reference UI, and the event bus that ties the systems together.
