class Bobrwm < Formula
  desc "Description"
  homepage "https://github.com/bobrwm/bobrwm"
  url "%%SOURCE_URL%%"
  sha256 "%%SOURCE_SHA256%%"
  head "https://github.com/bobrwm/bobrwm.git", branch: "main"

  bottle do
    root_url "https://github.com/bobrwm/bobrwm/releases/download/%%TAG%%"
    sha256 %%CELLAR_STR%%%%PLATFORM%%: "%%BOTTLE_SHA256%%"
  end

  depends_on :macos
  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    system "#{bin}/bobrwm", "--version"
  end
end
