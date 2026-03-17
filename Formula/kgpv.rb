class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
