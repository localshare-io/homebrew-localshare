class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/simple-tunnel/localshare/releases/download/v1.4.0/localshare-darwin-amd64"
      sha256 "2f7021eed96412c78d2323be5331537491f58ad3ed04cc48db816976a96a6aa0"
    else
      url "https://github.com/simple-tunnel/localshare/releases/download/v1.4.0/localshare-darwin-arm64"
      sha256 "952a6ae3ff0a0f43ad3d38571be3891c436416a875b24e71229e00e354fb1d75"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/simple-tunnel/localshare/releases/download/v1.4.0/localshare-linux-amd64"
      sha256 "aedcec2323d92c73032a80da3ac75d7dd36d887048344d77f43bd7370338af0e"
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