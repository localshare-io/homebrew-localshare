class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.0/localshare-darwin-amd64"
      sha256 "935606a70cc9481bae30786a10222c0c9d0a97d5bdd6d2671d2c1de27ee6ffe1"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.0/localshare-darwin-arm64"
      sha256 "0aa935fa3a7327901c601ec0216aa1dd2bb6a05ff0b5a351679242c1264bf2f4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.0/localshare-linux-amd64"
      sha256 "0683544b8fe2c5697a869e825b6a2b2e35b0332e1eb3b54378d2427fd5ab57b9"
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