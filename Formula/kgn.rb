class Kgn < Formula
  desc "Kubernetes node CPU, memory, GPU, and health viewer"
  homepage "https://github.com/jessegoodier/kutils"
  # Kept explicit so the kutils release workflow can update version and checksums.
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_amd64.tar.gz"
      sha256 "4d96b4283255c04fb34019cab86f8c530915754f82136ae276167757bb40b56c" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_arm64.tar.gz"
      sha256 "cc09060b01f9202fe5eb98b4e11b235eb31b99c36a63b1eeefdd0da8f1097cf8" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_amd64.tar.gz"
      sha256 "c4ec1e8790f294f5f3cbf37d03b416b981317a9baf4e7de5d192f9ce4c9897ea" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_arm64.tar.gz"
      sha256 "76a3cd2b4c8975c00bcb9837e2c170404e65fa1caf0c241d02167c0482c68338" # linux_arm64
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
