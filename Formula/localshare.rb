class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.10/localshare-darwin-amd64"
      sha256 "058cfac5a47fc2f470673d201e274fefe140011d234852cba2a703849d8c2c40"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.10/localshare-darwin-arm64"
      sha256 "5cb097c021f1f0434924113d2689b56e59f9a49494e846933aefe25564b237f2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.10/localshare-linux-amd64"
      sha256 "98964b62f2fcea392b2a9cbc2e73a1e6b4e39e69d2b2fffd5f113b07b1b4c04d"
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
