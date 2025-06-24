class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.15"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.15/localshare-darwin-amd64"
      sha256 "61cf0d6d1db7e750867b34cfcaf5aa6be4647b225602175d57ed9264fdcbd61b"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.15/localshare-darwin-arm64"
      sha256 "b087c6178fa343e899e835aa26df4af0a989746d7d74b2cbc4ac1be887cca46f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.15/localshare-linux-amd64"
      sha256 "b7c002b9bd153335d770560a478e5ea52823635a086a4e2a77972ac8cb77e91b"
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
