class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "160d2d919e31b1992148c354c3cf862bf6e996870951580dbd3449b55351b63e" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "54da91e2ba7ae30eeb9e09df8790390169083f0082979a68952b73c1ec77b89c" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "8c4b4674c77fe7a9922c6cda1f38c4da478ba3b858e3640413a80776e13b2379" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "bad947cc5f6b5fdac76fea12ebf7b07b9c0f4e08b377569de0b3ed0b6b1a2c3b" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
