class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.1/localshare-darwin-amd64"
      sha256 "35b2f969829296dfb64f4bb8313ba916613b4bd93d652284beddf8b01631d2af"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.1/localshare-darwin-arm64"
      sha256 "a1014897bdd47d190179288e744dbae7c9c91b46b7323b8ed13a8e4f86474c97"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.1/localshare-linux-amd64"
      sha256 "2bf952dbc581e5027110b07f2f243e33b910d94a9a1e39d20df9a4bc1e3b95f7"
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