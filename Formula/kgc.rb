class Kgc < Formula
  desc "Kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "af2259089ea77fd84763e7373d3bb259f49d607bb97d82e45d5438b0d23f1a17" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "716102768ffb564cef63f1cb4c7dbdbe3d6894140e22b60146ab8323b900a474" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "efd8048f76df12ee66bda6c277fb409efdd637f99f7987738b61148ed0925a8a" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "e6defd32dcbc28d7658c69c6ae21eb6693eaa61bd6c69164963ae30d520e7395" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
    generate_completions_from_executable(bin/"kgc", "--completions", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
