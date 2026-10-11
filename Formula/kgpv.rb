class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "741a837b0b36cbd883e6f376d35491505ebefba91a4be279eab76caed298d5b7" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "f822a029c8fa62d56efffe7b590b9929138e5671d7c90f977b0582b49d76d71f" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "37d74a5fb263a7dcebc73bfdcd9b053a0d1de6bd2275debef8f2180b238663ff" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "635b3e4d33c5539b98879f76e9da5db8ed7d82ce77f585ac535a5a7d1fc4c0ca" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
    generate_completions_from_executable(bin/"kgpv", "--completions", shells: [:bash, :zsh])
  end

  def caveats
    <<~EOS
      If you use oh-my-zsh, the kubectl plugin may define a conflicting alias.
      To check: alias | grep kgpv

      To unalias for your current session:
        unalias kgpv

      To make it permanent, add this to your ~/.zshrc:
        echo "unalias kgpv" >> ~/.zshrc
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
