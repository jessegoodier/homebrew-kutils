class Kgn < Formula
  desc "Kubernetes node CPU, memory, GPU, and health viewer"
  homepage "https://github.com/jessegoodier/kutils"
  # Kept explicit so the kutils release workflow can update version and checksums.
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_amd64.tar.gz"
      sha256 "9b7370460982399003bbcf9ff46713cee2608dc882e15863374af00787eec665" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_darwin_arm64.tar.gz"
      sha256 "7b1fc29af5baa8acfa65f1bfd456f3b96664db8ec00a56dced21c544093a4912" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_amd64.tar.gz"
      sha256 "665bc62163fb7a95b94ce7f85a615f01afb77a7a6bbbd3642b39516e33de7e3f" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgn_#{version}_linux_arm64.tar.gz"
      sha256 "dcd36da7fa1f32dc998b3bab7d96514f2fdaa6a2a6fcfbd56754a1e26df4fba3" # linux_arm64
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
