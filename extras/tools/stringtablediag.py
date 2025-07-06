#!/usr/bin/env python3

import os
import sys
from xml.dom import minidom

def get_all_languages(projectpath):
    """ Checks what languages exist in the repo. """
    languages = []
    for module in os.listdir(projectpath):
        if module.startswith("."):
            continue
        stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
        try:
            xmldoc = minidom.parse(stringtablepath)
        except Exception:
            continue
        keys = xmldoc.getElementsByTagName("Key")
        for key in keys:
            for child in key.childNodes:
                try:
                    if child.tagName not in languages:
                        languages.append(child.tagName)
                except Exception:
                    continue
    return languages

def check_module(projectpath, module, languages):
    """ Checks the given module for all the different languages. """
    localized = []
    stringtablepath = os.path.join(projectpath, module, "stringtable.xml")
    try:
        xmldoc = minidom.parse(stringtablepath)
    except Exception:
        return 0, localized
    keynumber = len(xmldoc.getElementsByTagName("Key"))
    for language in languages:
        localized.append(len(xmldoc.getElementsByTagName(language)))
    return keynumber, localized

def main():
    scriptpath = os.path.realpath(__file__)
    # Set path to repo root/addons relative to this script
    projectpath = os.path.abspath(os.path.join(os.path.dirname(scriptpath), "..", "..", "addons"))
    if not os.path.isdir(projectpath):
        print(f"ERROR: Directory not found: {projectpath}")
        sys.exit(1)

    # Command line option
    markdown = "--markdown" in sys.argv

    if not markdown:
        print("#########################")
        print("# Stringtable Diag Tool #")
        print("#########################")

    languages = get_all_languages(projectpath)
    if not markdown:
        print("\nLanguages present in the repo:")
        print(", ".join(languages))

    keysum = 0
    localizedsum = [0 for _ in languages]
    missing = [[] for _ in languages]

    for module in os.listdir(projectpath):
        keynumber, localized = check_module(projectpath, module, languages)
        if keynumber == 0:
            continue
        if not markdown:
            print("\n# " + module)
        keysum += keynumber
        for i in range(len(localized)):
            if not markdown:
                print("  %s %s / %i" % ((languages[i]+":").ljust(10), str(localized[i]).ljust(3), keynumber))
            localizedsum[i] += localized[i]
            if localized[i] < keynumber:
                missing[i].append(module)

    if not markdown:
        print("\n###########")
        print("# RESULTS #")
        print("###########")
        print("\nTotal number of keys: %i\n" % keysum)
        for i in range(len(languages)):
            if localizedsum[i] == keysum:
                print("%s No missing stringtable entries." % ((languages[i] + ":").ljust(12)))
            else:
                print("%s %s missing stringtable entry/entries." % ((languages[i] + ":").ljust(12), str(keysum - localizedsum[i]).rjust(4)), end="")
                print(" ("+", ".join(missing[i])+")")
        print("\n\n### MARKDOWN ###\n")

    print("Total number of keys: %i\n" % keysum)
    print("| Language | Missing Entries | Relevant Modules | % done |")
    print("|----------|----------------:|------------------|--------|")
    for i, language in enumerate(languages):
        if keysum == 0:
            percent = 100
        else:
            percent = round(100 * localizedsum[i] / keysum)
        if localizedsum[i] == keysum:
            print(f"| {language} | 0 | - | 100% |")
        else:
            print(f"| {language} | {keysum - localizedsum[i]} | {', '.join(missing[i])} | {percent}% |")

if __name__ == "__main__":
    main()
