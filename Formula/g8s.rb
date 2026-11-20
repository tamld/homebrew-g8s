class G8s < Formula
  desc "Zero-Trust Process & Capability Harness for AI Agents"
  homepage "https://github.com/tamld/g8s"
  version "0.26.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # darwin_all is a fat/universal binary covering both Intel and Apple Silicon.
    url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_darwin_all.tar.gz"
    sha256 "480e7f46b51962b44eb94a264f4db2ad46c78ba3c92cbf3e7ddce7c1544147d3" # darwin_all universal
  end

  on_linux do
    on_intel do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_amd64.tar.gz"
      sha256 "e682dd43d899c5ca6c4f8ff8cd11b6063d18ddec00e824933c79161ea784772f" # linux amd64
    end
    on_arm do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_arm64.tar.gz"
      sha256 "58b2f8bf305402ad9a288f078bab23118439d8f002b16fc715d632886dc90d29" # linux arm64
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
