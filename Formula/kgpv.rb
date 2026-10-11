class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "6ebde80e631879290d04e5a964c9acaac0daa019dbae487128447ad7f872e5ce" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "ecd185a216aadae1ce7ccc4660ae288776547a36dbb8ecdc385e65263fccb011" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "42ad48bafccb0eff1e35e6adcd19a5f4d63ab7a150b32fa9b819d5def75bd3b9" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "156678f78e7596d7dfff1cba2a3f741213813f3215921d95d56f6ec61b38f3ef" # linux_arm64
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
