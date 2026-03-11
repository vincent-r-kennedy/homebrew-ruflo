class Ruflo < Formula
  desc "Enterprise AI orchestration platform for Claude"
  homepage "https://github.com/ruvnet/ruflo"
  url "https://registry.npmjs.org/ruflo/-/ruflo-3.5.15.tgz"
  sha256 "7e484d706c26078ebdc296bd23470f022212f9377c4025963e2967360aeab56f"
  license "MIT"

  depends_on "node@20"

  # Pre-built native addon has insufficient header padding for dylib ID rewrite
  skip_clean "libexec"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")

    # Remove pre-built binaries for non-native architectures.
    # The npm tarball ships multi-arch prebuilds; keeping only the native
    # ones avoids brew-audit warnings and reduces install size.
    foreign_arch = Hardware::CPU.arm? ? "x64" : "arm64"
    nm = libexec/"lib/node_modules/ruflo/node_modules"
    system "find", nm, "-type", "d", "-name",
           "darwin-#{foreign_arch}", "-path", "*/prebuilds/*",
           "-exec", "rm", "-rf", "{}", "+"
    system "find", nm, "-type", "d", "-name", "ios-*",
           "-path", "*/prebuilds/*",
           "-exec", "rm", "-rf", "{}", "+"
    system "find", nm, "-type", "d", "-path",
           "*/onnxruntime-node/bin/napi-v3/darwin/#{foreign_arch}",
           "-exec", "rm", "-rf", "{}", "+"
    system "find", nm, "-type", "f",
           "-name", "*.darwin-#{foreign_arch}.node", "-delete"
  end

  def caveats
    <<~EOS
      ruflo requires Claude Code. If you don't have it installed:
        brew install --cask claude-code
      or see https://docs.anthropic.com/en/docs/claude-code
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ruflo --version")
  end
end
