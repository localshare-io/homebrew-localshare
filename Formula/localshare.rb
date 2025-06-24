class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.11"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.11/localshare-darwin-amd64"
      sha256 "d285ff35c659fea845a32fbd92675fcafacd3904fde18177a6b762442bcd23d1"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.11/localshare-darwin-arm64"
      sha256 "5dcd864cb7425f4f76246b1b0ec58de025d06c6babc1f6e30c85189801342c4d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.11/localshare-linux-amd64"
      sha256 "20f67da1fb4b870588c0ea3db8aa81a5d60f5a16364427c9747214eeb55ad7d7"
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
