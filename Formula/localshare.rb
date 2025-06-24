class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.12"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.12/localshare-darwin-amd64"
      sha256 "b3e16841e85f41287e6380f32a39ff0565a8ad9e5f15b9c3e9bcf0b1622e60d5"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.12/localshare-darwin-arm64"
      sha256 "2edf3665dc80c7aa0f1ed39715b69cdf9fc1895c9e4c432d9514980874f45e09"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.12/localshare-linux-amd64"
      sha256 "12a2aeb85c6bd91e2a8b29bd2ab73797f11c34bf5d0fa4502be73d36fa10eecd"
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
