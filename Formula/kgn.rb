class Kgn < Formula
  desc "Kubernetes node CPU, memory, GPU, and health viewer"
  homepage "https://github.com/jessegoodier/kutils"
  # Kept explicit so the kutils release workflow can update version and checksums.
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_amd64.tar.gz"
      sha256 "196a5af4be5be95b10c9fd16dfbb79538ead61ba3cf2a82fc024f6a134d017ee" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_arm64.tar.gz"
      sha256 "ae13354d4cb9ca121e463de6177aea23015aa0d733afd325c47285b7e8b7dfba" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_amd64.tar.gz"
      sha256 "d5b3e44ba34a3602298b7fdb458ac7f6387acdcfe488a04a8815c40d8d2bd8b1" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_arm64.tar.gz"
      sha256 "3d40016335bbd8a78f5f5f86f52e7e385e59707ffcc504cda7f317dafefbeccc" # linux_arm64
    end
  end

  def install
    bin.install "kgn"
    generate_completions_from_executable(bin/"kgn", "--completions", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgn --version")
  end
end
