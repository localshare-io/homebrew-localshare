class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.3/localshare-darwin-amd64"
      sha256 "0dcdd7a4d33d5713be768c8f1058e30fb274b749df0f88fe653b46fbe52251c0"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.3/localshare-darwin-arm64"
      sha256 "8670dde87454ecba9cab4a0685b494493fc25ceffa902308a46952a537ea4e1b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.3/localshare-linux-amd64"
      sha256 "c3cd84466890fbba3f87a116ab89e2b964bd987614e3436d8cca8eeeca36c756"
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
