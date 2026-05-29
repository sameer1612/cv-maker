#!/usr/bin/env python3
"""Generate a profile PDF by combining profile YAML with shared config."""

from __future__ import annotations

import os
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
        print(
            f"Error: Config file '{config_path}' does not exist in the 'data' folder."
        )
        return 1

    data_dir = Path("data").resolve()
    profiles_dir = Path("profiles").resolve()
    temp_path = data_dir / "temp.yaml"
    temp_path.write_bytes(input_path.read_bytes() + config_path.read_bytes())

    original_dir = Path.cwd()
    try:
        from rendercv import data as rcv_data
        from rendercv import renderer as rcv_renderer
        from rendercv.data.models import entry_types as rcv_entry_types
        from rendercv.data.models.entry_types import RenderCVBaseModelWithExtraKeys

        import pydantic

        class CommunityEntry(RenderCVBaseModelWithExtraKeys):
            """Custom entry type for community activities."""

            title: str = pydantic.Field(description="The title or role.")
            description: str | None = pydantic.Field(
                default=None, description="Event or activity name."
            )
            url: str | None = pydantic.Field(
                default=None, description="Link to the activity."
            )
            link_label: str | None = pydantic.Field(
                default=None, description="Display text for the link."
            )

        rcv_entry_types.CommunityEntry = CommunityEntry  # type: ignore[attr-defined]
        rcv_entry_types.available_entry_models = (
            rcv_entry_types.available_entry_models + (CommunityEntry,)
        )

        os.chdir(data_dir)
        cv = rcv_data.read_input_file(Path("temp.yaml"))
        typst_file = rcv_renderer.create_a_typst_file_and_copy_theme_files(
            cv, profiles_dir
        )
        pdf = rcv_renderer.render_a_pdf_from_typst(typst_file)
        print(f"Generated: {pdf}")
        return 0
    except Exception as e:
        print(f"Error: {e}")
        return 1
    finally:
        os.chdir(original_dir)
        temp_path.unlink(missing_ok=True)


if __name__ == "__main__":
    raise SystemExit(main())
