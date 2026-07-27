class Bobrwm < Formula
  desc "Tiling window manager for macOS (migrated to the bobrwm cask)"
  homepage "https://github.com/bobrwm/bobrwm"
  # Points at the rolling `tip` tag only so that `brew install bobrwm` reaches
  # the disable! check below. A head-only formula fails the "HEAD-only
  # formula" check first and never prints the replacement.
  url "https://github.com/bobrwm/bobrwm/archive/refs/tags/tip.tar.gz"
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "MIT"

  # bobrwm ships as Bobrwm.app now: the window manager needs a bundle
  # identifier to hold its Accessibility grant, and the client is a second
  # binary inside that bundle. Neither fits a formula.
  #
  # This stays here, disabled, so anyone who installed the formula is told
  # where to go. Deleting it instead leaves them on a build that never updates
  # again, and `brew info bobrwm` answers with a bare "No available formula".
  disable! date: "2026-07-27",
           because: "has been replaced by the bobrwm cask, which ships Bobrwm.app",
           replacement_cask: "bobrwm/tap/bobrwm"

  def install
    odie <<~EOS
      bobrwm is distributed as a cask now:
        brew uninstall bobrwm
        brew install --cask bobrwm/tap/bobrwm
    EOS
  end
end
