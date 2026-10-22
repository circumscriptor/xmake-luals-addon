"""Allow running the generator with ``python -m xmake_luals``."""

import sys

from .cli import main

if __name__ == "__main__":
    sys.exit(main())
