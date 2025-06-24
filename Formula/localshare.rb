class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.21"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.21/localshare-darwin-amd64"
      sha256 "551bb87ec0feabad89a6ce57aa582f2f7285da9849db537de030f27a03c81124"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.21/localshare-darwin-arm64"
      sha256 "f822ac44718f16d0f23f4ea329edc09244d09b3d88b8348f2022ff041532b725"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.21/localshare-linux-amd64"
      sha256 "3b2c7ef64d273928d3dfc842c6721f2408c669bde782e63308b993109d8a1a5f"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.intel?
        bin.install "localshare-darwin-amd64" => "localshare"
      else
        bin.install "localshare-darwin-arm64" => "localshare"
      end
    elsif OS.linux?
      bin.install "localshare-linux-amd64" => "localshare"
    end
  end

  test do
    assert_match "LocalShare v", shell_output("#{bin}/localshare -version")
  end
end
