class G8s < Formula
  desc "Zero-Trust Process & Capability Harness for AI Agents"
  homepage "https://github.com/tamld/g8s"
  version "0.25.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # darwin_all is a fat/universal binary covering both Intel and Apple Silicon.
    url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_darwin_all.tar.gz"
    sha256 "6e0e3cb6a02dde2eb5b66a5dcf17c8818477a57a0bf0f2fdd7d87d0075883450" # darwin_all universal
  end

  on_linux do
    on_intel do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_amd64.tar.gz"
      sha256 "f0565db26a7e476e43f0f63ac0f382d7b2fdba01b5034fa3ddb52d8dcb6417ef" # linux amd64
    end
    on_arm do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_arm64.tar.gz"
      sha256 "2c39748b4ee7fe556ed3dcdb10f73174c5ab32bf64ce463e8cb1d458c7318b3e" # linux arm64
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
