cask "bobrwm" do
  version "0.1.0-main-21655bc"
  sha256 "b2d18903c80965db2e02cc3482ca1deb466455c4209825d2880491a7bd202b37"

  # Rolling: `tip` is a moving tag republished on every push to main, so the
  # URL never changes. The version above exists only to make `brew upgrade`
  # notice that a new build landed.
  url "https://github.com/bobrwm/bobrwm/releases/download/tip/bobrwm-tip-aarch64-macos.zip",
      verified: "github.com/bobrwm/bobrwm/"
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
