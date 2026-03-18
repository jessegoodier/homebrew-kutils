class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "17b2038c4e6352ea8e22f4b7dc75351b00428b44e54d365abf1fccc642c129e7" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "cf428a257798aaac2e14f8e5fef19e9a1d413391522a217ad5e2ea4f5d5887ac" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "c43c4ef4c7a208ee4b586e81aff00e032ddf8bf14f69d09625ed3794c6011442" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "5b6232eb8548ea87294805516292c14f892ac97876a84697cb8a451404c772d6" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
