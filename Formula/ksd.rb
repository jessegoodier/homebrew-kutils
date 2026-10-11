class Ksd < Formula
  desc "Decode Kubernetes Secrets: kubectl get secret -oyaml with decoded values"
  homepage "https://github.com/jessegoodier/kutils"
  # version and sha256 values are placeholders until the first kutils release that
  # ships ksd; the kutils release workflow rewrites them automatically.
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_amd64.tar.gz"
      sha256 "8b7f688de2898c25b21182a3b8e81c48f8fd0331d74a2f8f1061006abd315de3" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_arm64.tar.gz"
      sha256 "4b278bcc491039f5b00a4ca869ff255ca9a0f412a92abd7c76475f8b6e1b74e1" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_amd64.tar.gz"
      sha256 "782d6e26ed02d7f5a19376d682d16c6b7712867c7f890aaad7c9b025c24f5351" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_arm64.tar.gz"
      sha256 "033f7e2b36999768c991831959e7fb7e23c50065e4e846a7f55b9c48f7cfa4d2" # linux_arm64
    end
  end

  def install
    bin.install "ksd"
    generate_completions_from_executable(bin/"ksd", "--completions", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ksd --version")
  end
end
