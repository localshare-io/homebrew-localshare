class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.1/localshare-darwin-amd64"
      sha256 "4cd816ddb097f1ad9b61cf70699520e5fd6f4980feddc48c5d390645f9dd9125"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.1/localshare-darwin-arm64"
      sha256 "d1ea74bf508ec04e9ce08763c0a7e69b1f14eb42e646f7a57e188d1a4250d807"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.1/localshare-linux-amd64"
      sha256 "aedcec2323d92c73032a80da3ac75d7dd36d887048344d77f43bd7370338af0e"
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