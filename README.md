

<p align="center">
    <img src="https://github.com/prisonerMO/iedd/raw/main/extras/assets/logo/logo.png" width="480" alt="IEDD logo">
</p>


***
# Arma 3 mod: Improvised Explosive Device Disposal

The project is entirely **open-source** and all contributions are welcome. Feel free to maintain your own custom version as long as the changes you make are open to the public in accordance with the <a href="LICENSE.txt">GNU General Public License</a>.
* Requires the latest version of CBA A3 mod [git][mod-cba-url-git] / [Steam workshop][mod-cba-url-ws]
* Requires the latest version of ACE 3 mod [git][mod-ace-url-git] / [Steam workshop][mod-ace-url-ws]

## Core features
- You have to move slowly nearby (walk)
- Activated by players
- Random activation distance (10-15 meters)
- EOD or Explosive Specialist unit trait is required to defuse (adjustable)
- Detectable with Ace metal detector
- Defusal kit required (adjustable)
- Defuse by cutting wires in certain order
- Adjustable wire cutting time, 1-30 seconds
- Defuse by explosives
- Defused IEDs can be moved
- Defused IEDs can be exploded
- Explodes when wrong wire is cut
- Random amplitude of explosion (adjustable)
- Chance of dud (adjustable)
- Duds can be exploded
- IEDs can be loaded to vehicle, but drive carefully (max 45km/h)
- Some IEDs are movable, some not
- Random ground signs (adjustable)
- Possibility to make fake IED (adjustable)

### Added features after release
- Zeus module, Activate IED. Activate selected IED considering its attributes.
- Zeus module, Explode IED. Explodes selected IED without considering its attributes.
- Zeus interaction (WINDOWS-key by default) to Activate or Explode multiple, Zeus selected, IEDs at the same time.
- Addon option to add IEDD Notebook to player(s) with EOD/Explosive specialist trait.
- Addon option to add Defusal Kit to player(s) with EOD/Explosive specialist trait.
- Vanilla mine detector to IEDD Notebook equipment box.
- Possibility to change wire cutting time for EODs/Explosive Specialists.
- Possibility to change wire cutting time for other units.
- IEDs are detectable also with vanilla mine detector.
- Possibility to determine if IEDs are detectable with Ace detectors and vanilla mine detector or not.
- Possibility to change min. and max. activation distance for IEDs.
- Possibility to interact with IEDs underwater.
- Adjustable wire cut failure option for EODs/Explosive Specialists.
- Adjustable wire cut failure option for other units.
- Adjustable possibility for activate IED after failed wire cut.
- "Just keep talking and nobody explodes-mode" = IEDD Notebook can't be opened near IEDs.
- Bomb vest (found under units attributes). Target with bomb vest can be escorted and unlike other IEDs in the mod, this doesn’t activate by moving/running near. Drive carefully! (max. - 45km/h)
- Option to add (adjustable) countdown timer to IEDs (found in object attributes). Timer starts after first wire cut.
- Option to change default IED-settings via CBA Settings.
- Adjustable activation distance for single IED in editor (found in object attributes).
- Adjustable activation distance for single IED in Zeus (Place IED-module).
- Add bomb vest-module for Zeus.
- Small electric crackling sound if wire cut is going to fail.
- Option to set countdown timer for Zeus placed IEDs and bomb vests.
- Variation X to all IED-types, excluding bomb vest. Variation X can’t be defused.
- Info to not touch to IED which isn’t in the notebook (About IEDs).
- Adjustable chance for spawning variation X when random is selected.
- Training IEDs (found in editor and Zeus, under props). Doesn't explode, pops only a red smoke if failed disarm. Training IEDs can be rearmed with same variation or random variation. - (Bele)
- New explosion size, "Tiny". (Bele)
- Option to totally ignore wire cutting orders for IEDs (for easier gameplay). (Bele)
- Suicide bomber (found under units attributes - IEDD Notebook Options).
- Zeus module for suicide bomber (found under modules - IEDD Notebook).
- Addon options for suicide bomber.
- Option to define activation side(s) for suicide bomber (unit attributes).
- Option to define activation side(s) for suicide bomber (Zeus).
- Addon option to include/exclude Zeus for activating suicide bomber.
- VBIEDs, Vehicle-borne improvised explosive devices (found under vehicle attributes).
- Predefined VBIED positions for vanilla civilian cars.
- Couple of activation options for VBIED (works with AI too).
- Option to make custom VBIED to any vehicle.
- Options to name and save/delete custom positions.
- Addon options for VBIEDs.
- Zeus module - Add VBIED (including custom positions).
- Zeus module - Activate VBIED.
- Zeus module - Explode VBIED.
- New IED type: Bucket.
- Few addon options for bucket IED.

***and more coming...***

## Getting started

IEDD Notebook requires [Arma 3][arma3-link-steam], the latest version of [CBA A3][mod-cba-url-ws] and the latest version of [ACE3][mod-ace-url-ws].
- You can use this mod [published version][mod-iedd-url-ws] simply by subscribing it from Steam Workshop and activating it in Arma3 Launcher.
- If you want to compile your own version you can clone this source and use [HEMTT][hemtt-releases-link] to compile it.

## Contributing

You can help out with the ongoing development by looking for potential bugs in our code base, or by contributing new features.
We are always welcoming new pull requests containing bug fixes, refactors and new features.
We have a list of tasks and bugs on our issue tracker on GitHub.
Please comment on issues if you want to contribute with, to avoid duplicating effort.


### Submitting issues

Head over to the [Issues][mod-iedd-url-git-issues] and press the “New Issue” button in the top right corner.
Fill out the issue template. Add a link (gist or pastebin) to the client and/or server RPT file.
An instruction to find your RPT files can be found from [BI Studio wiki][bistudio-link-crashfiles].


### Get in touch

| [Discord][discord-link] | We have a public Discord server that anyone can join. This is where all our developers and contributors hang out and where we make announcements |
| :---: | :---- |


## License

IEDD Notebook is licensed under the <a href="LICENSE.txt">GNU General Public License</a>.



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[discord-link]: https://discord.gg/SU3WJxHqtS
[arma3-link-steam]: https://store.steampowered.com/app/107410/Arma_3/
[bistudio-link-crashfiles]: https://community.bistudio.com/wiki/Crash_Files
[mod-cba-url-git]: https://github.com/CBATeam/CBA_A3/
[mod-cba-url-ws]: https://steamcommunity.com/workshop/filedetails/?id=450814997
[mod-ace-url-git]: https://github.com/acemod/ACE3
[mod-ace-url-ws]: https://steamcommunity.com/workshop/filedetails/?id=463939057
[mod-iedd-url-ws]: https://steamcommunity.com/workshop/filedetails/?id=3048818056
[hemtt-releases-link]: https://github.com/BrettMayson/HEMTT/releases
[mod-iedd-url-git-issues]: https://github.com/prisonerMO/iedd/issues
