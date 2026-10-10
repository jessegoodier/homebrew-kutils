class Ksd < Formula
  desc "Decode Kubernetes Secrets: kubectl get secret -oyaml with decoded values"
  homepage "https://github.com/jessegoodier/kutils"
  # version and sha256 values are placeholders until the first kutils release that
  # ships ksd; the kutils release workflow rewrites them automatically.
  version "0.1.16"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_amd64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_arm64.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000" # linux_arm64
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
