class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "f8049d8977438d7913dec5dcefe8c01ae49ddbf9deaa09ec7c563b876b47296e" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "e25262cd5ab54641efdc5164ad83b710c0e534b0e7dc5e6e3e9e4c3322b84614" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "4a324c0f88aabc8577b19b61b9c0d1a11e3890d0c81afd8905223b3e47dc6632" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "3894c4663262fef99af6c2cdb3712fe102ca31062564b20f977470ef23e7248f" # linux_arm64
    end
  end

  def install
    bin.install "kgpv"
    (bash_completion/"kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "bash")
    (zsh_completion/"_kgpv").write Utils.safe_popen_read(bin/"kgpv", "--completions", "zsh")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgpv --version")
  end
end
