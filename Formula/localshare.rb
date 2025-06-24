class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.18"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.18/localshare-darwin-amd64"
      sha256 "e957183cb48902026860d1d4c198d31633f08b17c0dd745e46436d572707b3ae"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.18/localshare-darwin-arm64"
      sha256 "e4c42b040484e05b2b2043ed192fae5f6ad59a3609937e21168525844412c037"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.18/localshare-linux-amd64"
      sha256 "b572ccdcc9e9460f032584a67017d1863dfa8ba8abe8abd7e98a98ff0c9c1f8d"
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
