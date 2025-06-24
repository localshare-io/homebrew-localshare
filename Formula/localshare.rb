class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.14"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.14/localshare-darwin-amd64"
      sha256 "673104cbf8225d0aae4d6c99102a5718b2df0adc5b957399fc749bcb86af8e52"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.14/localshare-darwin-arm64"
      sha256 "0ef79f02b1e0e88906fda91b73b998f0919e33e8c87a5f4717c898799d56c8a5"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.14/localshare-linux-amd64"
      sha256 "b0e861dd8375a12ec9458de319d7e397ae9340eb463e11639f19259290c1b8fa"
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
