class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.8/localshare-darwin-amd64"
      sha256 "9667e776ce078e03c1747fdc5acd678f2d6e0f39263c2e63a402668c09b001a0"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.8/localshare-darwin-arm64"
      sha256 "baa94793aa7a716f616c778b49fb7c95ca8a0066c28bc317cabe92b2fb46f39c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.8/localshare-linux-amd64"
      sha256 "8a61f9828f475e556d57ab9cf461448d357ce965ea767d3ec78772c28516adfd"
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
