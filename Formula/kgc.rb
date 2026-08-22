class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.15"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "59a8c87b22b9d571fd560cbc4f3e893def079e351b12b93a5367e1c9c778c77d" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "cd80efe78be30f6aa2c12a0b5093a6a8111245d7fbb897a7404f19348b7eed86" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "53d8e8664037ac6c6edd9651b75927360bd9005f87baeca306a6549793309302" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "fed5a050335b5b11719d8a72613dc5e2ba95756bd970e048fb033635d446de5a" # linux_arm64
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
