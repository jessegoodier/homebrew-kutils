class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "2c93e6de71c901d1cac591a2ba89c16865e4a1c38154440011e262432f7b40c5" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "97a77dd9bca56f8bb83da7fed2dbd3b835b0f1e4e2603f1fe842abd74bc0d1d7" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "01749a85e0d2227b76bebef137dfb55276971b1ddcdfcb3efb99426dc5a442ed" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "9b81220ae06171f1a7252a9bf8ee6d63e2d33f5349c1d19324253f161644b019" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
