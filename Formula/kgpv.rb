class Kgpv < Formula
  desc "List Kubernetes PersistentVolumes with PVCs, pods, zones, and sizes"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_amd64.tar.gz"
      sha256 "37c834836f5a1a6883839ba2df89702b6407fd4cfc69cbe1cf30d5bdcc290f90" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_darwin_arm64.tar.gz"
      sha256 "c05cf5077656f401074a6dfc38bdd6a78d333a9d38b8513529977dc9115291ca" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_amd64.tar.gz"
      sha256 "ecf9eed29f7ca80066ca5eec8c99baef14cfd75c110c143f501f1278029c8e49" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgpv_#{version}_linux_arm64.tar.gz"
      sha256 "f9de07858676d3243be6ae775244a7dd51454ba43b9ce86320093212a87c1e88" # linux_arm64
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
