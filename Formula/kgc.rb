class Kgc < Formula
  desc "Kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "d46160522ef5c8498358a8f97eda2b6f50ff56fb992983c43577ebefa9d3f6b0" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "9a4074ec358558f0d9f318406dfd7772a948d83d70b6b3eaace09c6e474452b0" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "14001a8b65336a174f230a58a946c6441bc11e4e6e174912f6f29d4b8f7d76bd" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "9944c5ac04ed319f49100460872b59b035527a24da6c1460dce7df11775befbf" # linux_arm64
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
