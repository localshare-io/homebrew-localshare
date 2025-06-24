class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.16/localshare-darwin-amd64"
      sha256 "a5d8e582575f20dc2bb742d9eddfbae6376ff336f2a1791f56a12538f35a3de5"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.16/localshare-darwin-arm64"
      sha256 "663791dfedeb53b481d979cacd4ee90685c743242d1380dbb484c9c6954f8153"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.16/localshare-linux-amd64"
      sha256 "234dbc6e99e43a905d71b6246962d538f8a76c743e09a261ac171fc62e038f45"
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
