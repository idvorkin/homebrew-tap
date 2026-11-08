class LavishAxi < Formula
  desc "Editor for HTML artifacts"
  homepage "https://github.com/kunchenguid/lavish-axi"
  url "https://registry.npmjs.org/lavish-axi/-/lavish-axi-0.1.96.tgz"
  sha256 "e10d57d4b2247ab671483589b22f2305fe9decd98babe4d446acc32ed4e6e702"
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
