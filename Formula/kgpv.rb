class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "2973918efc30a8b7c39dd6180db89321c54fc92c34ed6ef7208616ab1cd65bf4" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "786a6872b585ddd70956295ab444b3b5afaac22f0080732e1515071f039fdee5" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "25e1f9ffb54e920a4291093c138cb920ce7fcb9c4013fcbfdb81a5acfb372eef" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "ed4092f3fe2678ca306fcecf8cca61d01d70710a9256394c816205f277b7dc83" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
