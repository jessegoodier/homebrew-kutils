class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "278d69976de7e45b945b1d1df591998e417d31f81f2c5726610625d7163fb0a6" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "0b9033d04a4d9883e7eccfb2c7f0cbaa8eac6b03d4c3f183309d700d012e6c0f" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "b3ab935e262ec59c532a2c475e531f7be962bce8d7162c3967963c9390880072" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "b140120fe609ffbe28ed6974821685600b55a89ef1dda2a8f7baa76206d5d202" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
    (bash_completion/"kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "bash")
    (zsh_completion/"_kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "zsh")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
