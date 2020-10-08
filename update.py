"""Little helper for keeping my dot-files up to date..."""
import pathlib
import shutil
import os


_backup = {
    "zsh":  ["~/.zshrc"],
    "nvim": ["~/.config/nvim/local_bundles.vim",
             "~/.config/nvim/local_init.vim"],
}
"""items which should be backed up."""

HERE = pathlib.Path(__file__).parent.absolute()
"""Directory we are currently in."""


def backup(to_repository: bool = True):
    """Backup all files listed in the dictionary above in this repository
    If to_repository = True, the files are backed up from the machine to this
    repository, if False, the files are backed up from the repository to the
    machine.
    """
    print("Backing up dot-files...")
    for directory in _backup:
        for file in _backup.get(directory):
            on_machine = pathlib.Path(file).expanduser()
            in_repository = HERE / directory / on_machine.name
            src = on_machine if to_repository else in_repository
            dst = in_repository if to_repository else on_machine
            _print_result(src, "SUCCESS" if copy(src, dst) else "FAILED")

def copy(source: str, destination: str) -> bool:
    """
    Copy a files from source to destination if possible.
    If the source does not exist, nothing is copied.
    If the destination already exist, it is replaced with a copy of source.
    If destination directories have to be created.
    Return value: Did the source exist and was it copied?
    """
    if not source.exists():
        return False
    if destination.exists():
        destination.unlink()
    os.makedirs(name=destination.parent, exist_ok=True)
    shutil.copyfile(source, destination)
    return True


def _print_result(text: str, result: str):
    symbols = {
        "SUCCESS": u"\u2713",
        "FAILED": u"\u2717",
    }
    codes = {
        "SUCCESS": "\033[92m",
        "FAILED": "\033[91m",
    }
    end = "\033[0m"
    print(f"{codes[result]}{symbols[result]}{end} {text}")



if __name__ == "__main__":
    backup(to_repository=True)

