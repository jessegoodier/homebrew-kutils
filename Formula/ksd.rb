class Ksd < Formula
  desc "Decode Kubernetes Secrets: kubectl get secret -oyaml with decoded values"
  homepage "https://github.com/jessegoodier/kutils"
  # version and sha256 values are placeholders until the first kutils release that
  # ships ksd; the kutils release workflow rewrites them automatically.
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_amd64.tar.gz"
      sha256 "c943ca42b92f40999cd1ea363898035d65fcfe3859d892c3b80cb045a53ef164" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_arm64.tar.gz"
      sha256 "bba62f753fceba7582adbf724de304d5b8b78e203c7008a89cedf17877f98b30" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_amd64.tar.gz"
      sha256 "0075fccc68d2694b007283ca1a47ec197b90192ac44ff49f318a9d9a552056c5" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_arm64.tar.gz"
      sha256 "cb496abadd3b0f88c9cb3e08372a26085fe357dcf7d640211a640ef9669b18fc" # linux_arm64
    end
  end

  def install
    bin.install "ksd"
    (bash_completion/"ksd").write Utils.safe_popen_read(bin/"ksd", "--completions", "bash")
    (zsh_completion/"_ksd").write Utils.safe_popen_read(bin/"ksd", "--completions", "zsh")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ksd --version")
  end
end
