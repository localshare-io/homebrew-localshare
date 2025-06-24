class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.1/localshare-darwin-amd64"
      sha256 "7408b82e0a9d9d921ca1cb7f4a46eeadb6d09ce30e0f723a55433d4f1c0b52f7"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.1/localshare-darwin-arm64"
      sha256 "7630d6505dd117274760513e8a5dc10aa95fc16c668373a867ea5b3f905a4898"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.1/localshare-linux-amd64"
      sha256 "50467593a2665412fb91c6f3bee0e22203e7f1752407b80728b4a128b18159ad"
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
EOF < /dev/null