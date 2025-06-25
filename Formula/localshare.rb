class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.23"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.23/localshare-darwin-amd64"
      sha256 "a326e1bfa8022a93a07803b0905524ba3ab045d75c787929fd91a8b13dc0e548"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.23/localshare-darwin-arm64"
      sha256 "d7c2ee54bb569be5eb3a5655a20dd2c5ea2470e06e924a34fe5767b46d3b333d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.23/localshare-linux-amd64"
      sha256 "2b94086aa85eb98404594d6a53dc2be380eb7361e24c760376a968583025cbb6"
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
