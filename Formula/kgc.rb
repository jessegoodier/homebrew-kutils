class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "9e54253ec8d810a14982215b2e41357ed190497cec7b9d18060e9ed4bb88a484" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "d8a72fc722334decf4c4c62899508baf0c11e8df8367cad59ba9a7cd84c7d216" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "852e457ab325ea0b2b6b2f47f49d8f186026110484eb636675a232c113984465" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "7972c5fc3d71b41ba36c79251ecea2c0d9ae01535911f3670395391abe150cae" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
