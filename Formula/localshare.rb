class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.4/localshare-darwin-amd64"
      sha256 "a50dfe66db634ecf03c85523ee60abb568e58d48327c6835761b407f17a2465e"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.4/localshare-darwin-arm64"
      sha256 "34dcc1045360a6b9e1e244e04010937f3ddcea86abaf3f4fc9cf31eebbeeb143"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.4/localshare-linux-amd64"
      sha256 "eb6c0160b1dd1e7777b0431bf08220c5fe8115635fc6a4b7f6f5ce87a758323b"
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
