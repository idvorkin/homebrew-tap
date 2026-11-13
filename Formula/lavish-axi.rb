class LavishAxi < Formula
  desc "Editor for HTML artifacts"
  homepage "https://github.com/kunchenguid/lavish-axi"
  url "https://registry.npmjs.org/lavish-axi/-/lavish-axi-0.1.97.tgz"
  sha256 "84e4d91c173e91b966c506da770a649d533766d93985739d26b8592143127662"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/lavish-axi --version")
  end
end
