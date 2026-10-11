class Kgc < Formula
  desc "Kubectl get pods with color-coded status and last restart reason"
  homepage "https://github.com/jessegoodier/kutils"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_amd64.tar.gz"
      sha256 "484554c641a810d5040476d5f780acca861bd1ecce1369ff56b31f731ec7d2b7" # darwin_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_darwin_arm64.tar.gz"
      sha256 "766c2747dab538da7dd5820c7adbb6c935098b1152b38d31789c91226938ef58" # darwin_arm64
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_amd64.tar.gz"
      sha256 "9c4636166745609bb810acde664e71dd6c866f26fa745e79a834f647f34a770c" # linux_amd64
    end
    on_arm do
      url "https://github.com/jessegoodier/kutils/releases/download/v#{version}/kgc_#{version}_linux_arm64.tar.gz"
      sha256 "535e1b15d8af512ea21bc0485d4908bf780d9292da1381a23c85ceaf13bb25ff" # linux_arm64
    end
  end

  def install
    bin.install "kgc"
    generate_completions_from_executable(bin/"kgc", "--completions", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kgc --version")
  end
end
