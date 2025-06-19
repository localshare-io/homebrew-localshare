class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.0/localshare-darwin-amd64"
      sha256 "08f427811f518ab2bd20afa1519fb0dfcc0951479fd206c839ecfae7da2716dd"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.0/localshare-darwin-arm64"
      sha256 "789755ab5c9b12878a1269a83fa0491c940ef0df60c80e52520ad33a74ab4db6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.3.0/localshare-linux-amd64"
      sha256 "2827abec44ea70b4d489a04425d823a8f9b07045792787d9fcd463ddb2ac0da7"
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