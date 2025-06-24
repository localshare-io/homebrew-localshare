class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.13"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.13/localshare-darwin-amd64"
      sha256 "993444c38e4047cfb164488e6306420b13ba0b430b6dc4ac51b1c202e45c8a18"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.13/localshare-darwin-arm64"
      sha256 "ecc243e527d552d4184cf372c06f377ef62ac2155c402d7e0f1b5881c38923ee"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.13/localshare-linux-amd64"
      sha256 "7fe8f9b81663c639553a0dfdb96f8159d9ce33142eb254f635d9df37c9880341"
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
