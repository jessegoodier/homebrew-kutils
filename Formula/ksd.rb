class Ksd < Formula
  desc "Decode Kubernetes Secrets: kubectl get secret -oyaml with decoded values"
  homepage "https://github.com/jessegoodier/kutils"
  # version and sha256 values are placeholders until the first kutils release that
  # ships ksd; the kutils release workflow rewrites them automatically.
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_amd64.tar.gz"
      sha256 "de32ac0dddf60ecdec56334d2ac73afc6c7392f6f202442bdba6ee0d4e640439" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_darwin_arm64.tar.gz"
      sha256 "5c0bdc95e1086d043d9d173a96dd991dc27632cb7438fcaa1ed7fde43e4fc4ff" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_amd64.tar.gz"
      sha256 "5f6a01f07c1605b5ec3d0cf529aa96515b13a26db05c6b7d7982e4980f0a5d12" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/ksd_#{version}_linux_arm64.tar.gz"
      sha256 "113fde60ebcb87b1117b14dac0cd73cc16c0953485575d6a6dfd912a4a75ae8c" # linux_arm64
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
