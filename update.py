import pathlib
import shutil


_backup = {
    'fish': ['~/.config/fish/config.fish'],
    'nvim': ['~/.config/nvim/local_bundles.vim',
             '~/.config/nvim/local_init.vim'],
}
"""items that should be updated."""


def update_repo():
    """ Update the local repository from the configuration files

    We do not want this to be executed depending on the current working
    directory but from the location of this python module.
    """
    location = pathlib.Path(__file__).parent.absolute()
    for directory in _backup:
        for file in _backup.get(directory):
            source = pathlib.Path(file).expanduser()
            destination = location / directory / source.name
            if source.exists():
                if destination.exists():
                    destination.unlink()
                shutil.copyfile(source, destination)
                print(f'Updating {source} -> {destination}')
            else:
                print(f'Configuration file {source} does not exist, so it '
                      f'can not be saved.')


if __name__ == '__main__':
    update_repo()

