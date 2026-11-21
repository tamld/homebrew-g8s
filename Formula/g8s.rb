class G8s < Formula
  desc "Zero-Trust Process & Capability Harness for AI Agents"
  homepage "https://github.com/tamld/g8s"
  version "0.27.1"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # darwin_all is a fat/universal binary covering both Intel and Apple Silicon.
    url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_darwin_all.tar.gz"
    sha256 "7d7dad60cad9ad7daa7b3358bf90a6030c0f6e8b1fb8651e9ac57c315bb758e2" # darwin_all universal
  end

  on_linux do
    on_intel do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_amd64.tar.gz"
      sha256 "a82ebb2db62b89a13f947051fa1737c81dbdf2cab4a8c4df4147e2625188f27c" # linux amd64
    end
    on_arm do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_arm64.tar.gz"
      sha256 "81ead239fa3cb41a1345695984747ec7201d46a9fa5c565d6c8badf3c4ff20f4" # linux arm64
    end
  end

  def install
    bin.install "g8s"
  end

  def caveats
    <<~EOS
      Binary release shipped by the tamld/g8s tap (prebuilt from the signed
      g8s GitHub release; checksums verified at release time by the tap's
      update workflow). Sanity-check your install with:
        g8s doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/g8s version")
  end
end
