class CyberRain < Formula
  desc "Smoother, themeable Rust terminal digital-rain visualizer"
  homepage "https://github.com/anthony-cervantes/cyber-rain"
  url "https://crates.io/api/v1/crates/cyber-rain/0.3.0/download"
  sha256 "20b657d98f2e7c8f8c103ab18cc49940385c09599cb723d554b4305cda29a117"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/anthony-cervantes/homebrew-tap/releases/download/cyber-rain-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "280499505cd9bd739d4a55ba2c09b00b456d41e17abf30399255f4b97cb4fbcc"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8580a9cd10db45c1164d1347c48a74ed9cafe94b812eeffb0b55d65ccca3ed2a"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:   "5c5da5dffd8a919a7ed2cf510dbea2f07717b3f3d33de05dfe55db8bf9c7109a"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "1dc1a59ed6ed54ad2bdd95ddac4e54e5f9af0472633f8cafab0dea35bfbce519"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/cyber-rain.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cyber-rain --version")
    assert_match "Usage: cyber-rain", shell_output("#{bin}/cyber-rain --help")
  end
end
