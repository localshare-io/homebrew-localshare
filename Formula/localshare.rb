class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.17"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.17/localshare-darwin-amd64"
      sha256 "049f25c37d56981f22c10dee20b4c1c06945d77f89a3c04ec92f2d4dfc979453"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.17/localshare-darwin-arm64"
      sha256 "2b8d46fc4f40a619e11df2bdbcefc3d92d5fbec876b7e6de618599750318914f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.17/localshare-linux-amd64"
      sha256 "003f6bc5b2e4e5bd19ca309e10039453f5503e91a100c02462bf7bb3a4df11c7"
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
