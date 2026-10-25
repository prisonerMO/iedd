# Overwrites files in /include with updated versions from D:\arma

import os
import shutil

include_base_path = os.path.join(
    os.path.dirname(os.path.dirname(os.path.realpath(__file__))), "include"
)

source_root = r"D:\arma"

if not os.path.exists(source_root):
    raise Exception(f"Missing source folder: {source_root}")

for root, _dirs, files in os.walk(include_base_path):
    for file in files:
        if file == "$PBOPREFIX$":
            continue

        file_r_path = os.path.join(root, file)
        rel_path = os.path.relpath(file_r_path, include_base_path)

        if file.endswith(".p3d"):
            print(f"ignoring p3d {rel_path}")
            continue

        # include\x\cba\... -> D:\arma\cba\...
        norm = os.path.normpath(rel_path)
        if norm.startswith("x" + os.sep):
            norm = norm[2:]

        file_v_path = os.path.join(source_root, norm)
        if not os.path.isfile(file_v_path):
            raise Exception(f"Missing source file {file_v_path}")

        shutil.copyfile(file_v_path, file_r_path)
        print(f"copying {file_v_path}")