class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.9/localshare-darwin-amd64"
      sha256 "80162dc0acbd0e0b4e5960863d17e90f124c1da22cd3fc24cd74074e7735b04e"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.9/localshare-darwin-arm64"
      sha256 "1583b41a17871fc31954c6ad1a9411eca709c3c9d0860c7dbb25904cfe5fd11e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.9/localshare-linux-amd64"
      sha256 "db7b9546ff281070d8cc42df8d941bd9701972ceb57747e6fd9a1f2dc05db0b6"
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
