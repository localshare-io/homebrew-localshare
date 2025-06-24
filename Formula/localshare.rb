class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.7/localshare-darwin-amd64"
      sha256 "f0bf7f75361ccefb58a35d066ee618b862359021f377c0fe0c0d4092ce7f9e7d"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.7/localshare-darwin-arm64"
      sha256 "618e491be1d07dcc2a4544214bd0b4e767ef733fb720247676bccbc7b65051bd"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.7/localshare-linux-amd64"
      sha256 "e0cb23a13a98211c15e22da799d5d5c7ed2b4fccb9621c203f5970e1f25b2574"
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
