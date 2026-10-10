class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "06098598f21cccf4234a5e8777015e9acee4cb755db2a95852cecc34612821ad" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "ef598171daa757185d483b1c7702fe38530e6fe798cb204e5851316b6d9cfe3d" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "deb06a291548ec30c9df8b1b4bf7b9abe4993b0c6e558eaea20506969f9f9156" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "cb8b01dae1c5dae3e36f521fb0d08bd7dccca0df3cde40f3aac6db06ec4ca3d6" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
    (bash_completion/"kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "bash")
    (zsh_completion/"_kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "zsh")
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
