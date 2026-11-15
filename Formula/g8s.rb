class G8s < Formula
  desc "Zero-Trust Process & Capability Harness for AI Agents"
  homepage "https://github.com/tamld/g8s"
  version "0.24.0"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    # darwin_all is a fat/universal binary covering both Intel and Apple Silicon.
    url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_darwin_all.tar.gz"
    sha256 "d5b6d7a8ed41c3acd411a215eaac22e3b362465c884f6f88b5a3a4eb98890ac8" # darwin_all universal
  end

  on_linux do
    on_intel do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_amd64.tar.gz"
      sha256 "3bf45b8ba2bd1047f5ee714619a2769d4f12d1b5f0aac1b647de6cda87d52002" # linux amd64
    end
    on_arm do
      url "https://github.com/tamld/g8s/releases/download/v#{version}/g8s_#{version}_linux_arm64.tar.gz"
      sha256 "da949913195078676d433bdf70ef7f24612f9335379bed654021066d3e1b938e" # linux arm64
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
