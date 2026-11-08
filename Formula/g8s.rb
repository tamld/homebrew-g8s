class G8s < Formula
  desc "Zero-Trust Process & Capability Harness for AI Agents"
  homepage "https://github.com/tamld/g8s"
  version "0.23.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # darwin_all is a fat/universal binary covering both Intel and Apple Silicon.
    url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_darwin_all.tar.gz"
    sha256 "d92b7a00e5fb053ed89560666b96e987fcd1c28ed7ef82ebe9df12afdbc13d45" # darwin_all universal
  end

  on_linux do
    on_intel do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_amd64.tar.gz"
      sha256 "80302e95a619e8a46227a99c38f6597aadb92a16c6062fea3f6ac784d2039a1a" # linux amd64
    end
    on_arm do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_arm64.tar.gz"
      sha256 "560939218a26dc8d27cf4b1cb383051f34d3dc7b23d8047e005d46674ddbd9d4" # linux arm64
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
