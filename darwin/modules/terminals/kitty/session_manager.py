from typing import List
import os
import subprocess


FZF_OPTIONS = "-p 53%,58%"


def main(args: List[str]):
    fzf_path = args[1]
    res = subprocess.run(
        'zoxide query -l | sed -e "$HOME_REPLACER"'.split(" "), capture_output=True
    )
    os.system(f"{fzf_path}")
