class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.2/localshare-darwin-amd64"
      sha256 "cff0a53d7c4e7d40c3df2095bbbbbad0d9a96188ac3cae9555387970ee0e4f48"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.2/localshare-darwin-arm64"
      sha256 "3e43c633ac766d48edb77258b3bfb37ce5520c843aad1184914c5895376b0988"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.2/localshare-linux-amd64"
      sha256 "5cbfac7356d0f6872a52206992613d520af2d0bcf8b6a61b965e2a6249081277"
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