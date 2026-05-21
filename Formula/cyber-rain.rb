class CyberRain < Formula
  desc "Smoother, themeable Rust terminal digital-rain visualizer"
  homepage "https://github.com/anthony-cervantes/cyber-rain"
  url "https://crates.io/api/v1/crates/cyber-rain/0.3.0/download"
  sha256 "20b657d98f2e7c8f8c103ab18cc49940385c09599cb723d554b4305cda29a117"
  license any_of: ["MIT", "Apache-2.0"]

  bottle do
    root_url "https://github.com/anthony-cervantes/homebrew-tap/releases/download/cyber-rain-0.3.0"
    sha256 cellar: :any_skip_relocation, arm64_sonoma: "ded820bc5e168e68c10f59632c7cf75d1d0f34a822ac183705ed31cd2b715855"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "597afa09372b190a250f5045959cbee5ae044138db3b7f51c8d208f251f12f7a"
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
