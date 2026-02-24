class Bobrwm < Formula
  desc "Description"
  homepage "https://github.com/bobrwm/bobrwm"
  head "https://github.com/bobrwm/bobrwm.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", "-Doptimize=ReleaseFast", "--prefix", prefix
  end

  test do
    system "#{bin}/bobrwm", "--version"
  end
end
```

Users install with:
```
brew install --HEAD bobrwm/tap/bobrwm
