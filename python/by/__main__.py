from __future__ import annotations

import os
import sys

from by import find_by_bin


def _run() -> None:
    by = find_by_bin()

    if sys.platform == "win32":
        import subprocess

        # Avoid emitting a traceback on interrupt
        try:
            completed_process = subprocess.run([by, *sys.argv[1:]])
        except KeyboardInterrupt:
            sys.exit(2)

        sys.exit(completed_process.returncode)
    else:
        os.execvp(by, [by, *sys.argv[1:]])


if __name__ == "__main__":
    _run()
