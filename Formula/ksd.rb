class Ksd < Formula
  desc "Decode Kubernetes Secrets: kubectl get secret -oyaml with decoded values"
  homepage "https://github.com/jessegoodier/kutils"
  # version and sha256 values are placeholders until the first kutils release that
  # ships ksd; the kutils release workflow rewrites them automatically.
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_amd64.tar.gz"
      sha256 "c46dc5986b8eb1b434342ac524068e0e2fbd8345e570acf958ab8ab8a5353713" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_arm64.tar.gz"
      sha256 "efdf94148265ea9864802fdfd22d3146764e08603fe46bfe2e2ce56c5c1dfdfb" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_amd64.tar.gz"
      sha256 "2b757910d67bffbc415c5944d60685c5394cddd3adefa2d0343821f15889503b" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_arm64.tar.gz"
      sha256 "12b5e44da57678e990fea55b98ce2440ba41a16fcc974f139fa2fefe01ceb254" # linux_arm64
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
