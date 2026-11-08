class Treehouse < Formula
  desc "Manage worktrees without managing worktrees"
  homepage "https://github.com/kunchenguid/treehouse"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    on_arm do
      url "https://github.com/kunchenguid/treehouse/releases/download/v3.1.8/treehouse-v3.1.8-darwin-arm64.tar.gz"
      sha256 "007c55c26e0bd8b672b1a917465f06c3f89d93a66cd171364ffb65743d268601"
    end
    on_intel do
      url "https://github.com/kunchenguid/treehouse/releases/download/v3.1.8/treehouse-v3.1.8-darwin-amd64.tar.gz"
      sha256 "6be7f71cc8c6a1fbf40311af8ee3c45459c72afbab2c93dc2f80a183427bcbeb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kunchenguid/treehouse/releases/download/v3.1.8/treehouse-v3.1.8-linux-arm64.tar.gz"
      sha256 "3d1c02c8ab13049709ace66be51d99b72fe7b6d0b73d0d0efd90f226e1aa87d1"
    end
    on_intel do
      url "https://github.com/kunchenguid/treehouse/releases/download/v3.1.8/treehouse-v3.1.8-linux-amd64.tar.gz"
      sha256 "bd6227d909ba8046263ae5d4e072ccbcf43010cac9d7289b1262126510edfeed"
    end
  end

  def install
    bin.install "treehouse"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/treehouse --version")
  end
end
