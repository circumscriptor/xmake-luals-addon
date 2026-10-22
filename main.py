#!/usr/bin/env python3
"""Executable entry point for generating xmake LuaLS annotations."""

import sys

from xmake_luals.cli import main

if __name__ == "__main__":
    sys.exit(main())
