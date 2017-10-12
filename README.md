**Dotfiles Redux**

GNU Stow based dotfiles repo. Initial layout inspired by [F-dotfiles](https://github.com/Kraymer/F-dotfiles/).

## Rules

### Directory naming

Shamelessly copied:

- Lowercase for packages to install in `$HOME`
- Titlecase for packages to install as root in `/`
- Leading `@` for environment packages and subpackages
- Leading `_` for nonpackages
- `bootstrap.sh` in root of package for setup tasks

