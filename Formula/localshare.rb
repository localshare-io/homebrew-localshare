class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.0/localshare-darwin-amd64"
      sha256 "b1ec491a59f5e029754c46617797e027e8a92d7ffc3c1cb28c0defa400592f3f"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.0/localshare-darwin-arm64"
      sha256 "e5f4546ab1ff3676c79e831e585e054103e3a0556a51399f8df1fa8c65bff945"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.0/localshare-linux-amd64"
      sha256 "48c917d17305eb5114d555f7e0bb9762964bff9a58762d1828b62a3974ca006c"
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