class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.20"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.20/localshare-darwin-amd64"
      sha256 "0db5b98b6ddf2b3d923ac59ebe8dfc269784bf782ef1f4e6e6fb9a05d319c31a"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.20/localshare-darwin-arm64"
      sha256 "4f4fc30fad4f694948a29f717974a88f46eb8a39292220df804056fa6ccb828b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.20/localshare-linux-amd64"
      sha256 "2b5df11a3e6a65a0d2a567dce6b4242717ed09996e81648a1bd7cbbd2675000f"
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
