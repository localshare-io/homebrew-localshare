class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.2/localshare-darwin-amd64"
      sha256 "cb21afc639ea0c089a6316eb313cab1500ea53a094b1f1195e36732859120677"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.2/localshare-darwin-arm64"
      sha256 "0d06b185efda1617c492928af50edabc10baf829c05b6b240af87b0253b452c8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.4.2/localshare-linux-amd64"
      sha256 "df3d32f697ad38211360df8b50aed4f2dd51d72be96938f3e6e2aaa4a4d76979"
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