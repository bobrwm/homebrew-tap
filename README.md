# bobrwm Homebrew tap

Use this to install a notarized, signed `Bobrwm.app` via Homebrew.

```sh
brew trust bobrwm/tap
brew install --cask bobrwm/tap/bobrwm
open -a Bobrwm
```

Installing this will also link the `bobrwm` CLI client into your path. To use
bobrwm effectively, you'll need to grant Accessibility access in System Settings.
If you want bobrwm to start at login, set `.start_at_login = true` in
`~/.config/bobrwm/config.zon`.

## Rolling Release

Due to the nature of a macOS window manager, bobrwm is a rolling release. Every
commit to main releases a new version of the app. You can update to the latest
version by running:

```sh
brew update
brew upgrade --cask bobrwm/tap/bobrwm
```
