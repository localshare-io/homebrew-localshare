class Localshare < Formula
  desc "Share local directories over the internet instantly"
  homepage "https://github.com/localshare-io/localshare"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.1/localshare-darwin-amd64"
      sha256 "81487bbe02ebf249d8421bb69ab52163c7eda4d0539963d548508fc8024d4fa5"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.1/localshare-darwin-arm64"
      sha256 "97e28c969fbf85f866b4d3b0ae40b1951940a8299ab0d58327fd15634649a82b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v1.2.1/localshare-linux-amd64"
      sha256 "b0aef68a51905d7c97f02d05ddfa1fbff0ef66430e9002951f2d1d25fc57b56d"
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