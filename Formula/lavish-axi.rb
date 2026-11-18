class LavishAxi < Formula
  desc "Editor for HTML artifacts"
  homepage "https://github.com/kunchenguid/lavish-axi"
  url "https://registry.npmjs.org/lavish-axi/-/lavish-axi-0.1.98.tgz"
  sha256 "429d796a03771a759d1df8967a58ff596ad5b5634a6382a530b4f917ea67d0fb"
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
