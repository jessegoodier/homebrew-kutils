class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "fa99e4b25b93d610b4e14b51b77870aabc512d101db0cf177322fffb2ed26bbf" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "c71bde91b8cfff2f08525bef0cd00d8be1e070e4a1877f64c67d2d0a24748180" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "641bc3024a3bf7f4df36bd211189326c12791d58e79dc59d6ea0b9876ead70f9" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "7ec5e7e330424e02883d32b991fbcc5dbdd956a30999e26aa03b1ae06bf5d195" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
    (bash_completion/"kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "bash")
    (zsh_completion/"_kgc").write Utils.safe_popen_read(bin/"kgc", "--completions", "zsh")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
