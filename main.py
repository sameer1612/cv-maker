#!/usr/bin/env python3
"""Generate a profile PDF by combining profile YAML with shared config."""

from __future__ import annotations

import shutil
import subprocess
import sys
from pathlib import Path


def main() -> int:
    if len(sys.argv) > 2:
        print(f"Usage: {Path(sys.argv[0]).name} [data/<profile filename>]")
        return 1

    input_path = Path(sys.argv[1]) if len(sys.argv) == 2 else Path("data/profile.yaml")
    if not input_path.is_file():
        print(f"Error: File '{input_path}' does not exist in the 'data' folder.")
        return 1

    config_path = Path("data/config.yaml")
    if not config_path.is_file():
        print(f"Error: Config file '{config_path}' does not exist in the 'data' folder.")
        return 1

    temp_path = Path("data/temp.yaml")
    temp_path.write_bytes(input_path.read_bytes() + config_path.read_bytes())

    try:
        rendercv_exe = shutil.which("rendercv")
        if rendercv_exe:
            cmd = [
                rendercv_exe,
                "render",
                str(temp_path),
                "-nohtml",
                "-nomd",
                "-nopng",
                "-pdf",
                "profiles/",
            ]
        elif shutil.which("uv"):
            cmd = [
                "uv",
                "run",
                "rendercv",
                "render",
                str(temp_path),
                "-nohtml",
                "-nomd",
                "-nopng",
                "-pdf",
                "profiles/",
            ]
        else:
            print("Error: 'rendercv' is not installed and 'uv' is not available.")
            print("Install dependencies with: uv sync")
            return 1

        return subprocess.run(cmd, check=False).returncode
    finally:
        temp_path.unlink(missing_ok=True)


if __name__ == "__main__":
    raise SystemExit(main())

