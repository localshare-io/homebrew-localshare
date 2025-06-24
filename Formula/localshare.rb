class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.6/localshare-darwin-amd64"
      sha256 "5dfa8f911c31bcd2eb7646b4381cabc05915827e5569a18b8df9aeeed479fbcc"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.6/localshare-darwin-arm64"
      sha256 "6734fbedb05f3b52f79666a11055f36c656b2c42f6a9b56f18e867b7084a7e0c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.6/localshare-linux-amd64"
      sha256 "4d57875910816ef659efde40136e61b9c68dbba557a692aad0339647550015b9"
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
