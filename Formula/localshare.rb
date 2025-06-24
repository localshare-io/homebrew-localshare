class Localshare < Formula
  desc "Share local directories over the internet instantly with a modern React UI"
  homepage "https://github.com/localshare-io/localshare"
  version "2.0.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.5/localshare-darwin-amd64"
      sha256 "c43a181154d358defc26bff685b3d9ac9d2825b31a2ea6c54b0452c26171356e"
    else
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.5/localshare-darwin-arm64"
      sha256 "b8ec7248942424d400be72858bdd23b4a184c8f5e14827ac1b4a50b9ab1e1b10"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/localshare-io/localshare-releases/releases/download/v2.0.5/localshare-linux-amd64"
      sha256 "d6ad57703945ba86678f1e5d1d6ae2e0c678e6bc0d54706941b184964beb49a0"
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
