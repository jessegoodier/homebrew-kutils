class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "a1381ed0d55996b73b4026dc691a433849f51b5a21f7ebb2e4c7d437177719f0" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "2229d1f91d58e7ce70cf92bc67a879b94126c783585c5986e6ee93f0074b217f" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "86b37a25cba43d07bd4e3aca6ff5a939f2f5b6fec485c2e1b1bdcb20109670ed" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "66f4aff18971f15ecaa14df515190dd249251f8eddbd39731c0dc394d8970e03" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
