class Kgc < Formula
  desc "kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "9f37bc9bc019a49c7a3a53566b093d0daa82284232159eb890cdd35392ed8154" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "9803d393e1760f03c26e50c7866a060e989740e7cf10303b14d43eec92fdedc6" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "9b778eed9c84468c5d22bb4f375dc877c6f56d356001652862037b44f1a0269c" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "df092f8c90ecd4aa4b1955588f70ccfd5db35a773e63becab212f3f91b79e869" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
