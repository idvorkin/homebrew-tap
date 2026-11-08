class NoMistakes < Formula
  desc "Git push gate that reviews, tests, and validates changes"
  homepage "https://github.com/kunchenguid/no-mistakes"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/kunchenguid/no-mistakes/releases/download/v1.106.1/no-mistakes-v1.106.1-darwin-arm64.tar.gz"
      sha256 "3105ae3ffd9f5f6dc27674302dcd126a89ba9c23d43ecb8be5e266ac52f1472c"
    end
    on_intel do
      url "https://github.com/kunchenguid/no-mistakes/releases/download/v1.106.1/no-mistakes-v1.106.1-darwin-amd64.tar.gz"
      sha256 "a1df9a1e456e265c989ddb17968317f3d21bf80b23b9828cbd426777f279bfb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kunchenguid/no-mistakes/releases/download/v1.106.1/no-mistakes-v1.106.1-linux-arm64.tar.gz"
      sha256 "8529f37d3b11a213abe9162851e84208e9c12e9d8ebf830e037f05e00558a656"
    end
    on_intel do
      url "https://github.com/kunchenguid/no-mistakes/releases/download/v1.106.1/no-mistakes-v1.106.1-linux-amd64.tar.gz"
      sha256 "fbf131356a278623a509b6b50ecb39c5375b1a82e7dcfc48e42d10e761416d1e"
    end
  end

  def install
    bin.install "no-mistakes"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/no-mistakes --version")
  end
end
