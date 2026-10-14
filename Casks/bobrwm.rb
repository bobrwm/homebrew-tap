cask "bobrwm" do
  version "0.1.0-main.69.1"
  sha256 "33b2536f9f47a76a8eb8e20a9efbe4de9a7da0d7fd6f3aeff7aae63ed59154c6"

  url "https://github.com/bobrwm/bobrwm/releases/download/tip/bobrwm-tip-38608839948-1-aarch64-macos.zip"
  name "bobrwm"
  desc "Tiling window manager for macOS"
  homepage "https://github.com/bobrwm/bobrwm"

  livecheck do
    skip "Rolling release; the upstream release workflow updates this cask"
  end

  depends_on macos: :ventura
  depends_on arch: :arm64

  app "Bobrwm.app"
  binary "#{appdir}/Bobrwm.app/Contents/MacOS/bobrwm-cli", target: "bobrwm"

  uninstall quit: "com.bobrwm.bobrwm"

  # Leaves ~/.config/bobrwm alone: the config is the user's, not ours.
  zap trash: [
    "~/Library/Application Support/com.bobrwm.bobrwm",
    "~/Library/Caches/com.bobrwm.bobrwm",
    "~/Library/Preferences/com.bobrwm.bobrwm.plist",
  ]

  caveats <<~EOS
    Bobrwm needs Accessibility access to manage windows. Launch it once, then
    grant it in System Settings > Privacy & Security > Accessibility.

    To run it at login, set `.start_at_login = true` in
    ~/.config/bobrwm/config.zon.

    Upgrading from the old formula? Remove it so the two do not both own
    `bobrwm` on your PATH:
      brew uninstall --formula bobrwm
  EOS
end
