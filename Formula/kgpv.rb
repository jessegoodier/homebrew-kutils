class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "fb86221819d7df0f784cd55894e2c21413954c7dca0d6a6a95e241fc84c0942e" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "18a40f027465f7267a781d0ee75419af17ed13a1cdb6efc241f709ec89a763ba" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "b8d342054672eddd854c7d5f2967f57acbc23d465333f45018daedf1b2eace87" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "bcca3bddf16076f59ddabe0671fc263c0e80e1b3a013091a924e5252283c8cee" # linux_arm64
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
