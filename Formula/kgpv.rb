class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "812ed0c7d5bfdd01bf3f218a0afb7f95337ae5a9b0c80fe1cab2f5b3478444ac" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "5ba402547a72f9e72d507e4deadf3f01b31778a6af470ffe593fd00d92bd341c" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "6bc62b71537da474e1ddfb1d4534c426418cdeb039d89069fd820f86cac801f3" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "c5674506828aeff8fc92563ed0863a459dc50ba252d1cf51825310a45fba8688" # linux_arm64
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
