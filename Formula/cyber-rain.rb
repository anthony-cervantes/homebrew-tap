class CyberRain < Formula
  desc "Smoother, themeable Rust terminal digital-rain visualizer"
  homepage "https://github.com/anthony-cervantes/cyber-rain"
  url "https://crates.io/api/v1/crates/cyber-rain/0.1.0/download"
  sha256 "b36a3169d480302c592876b834d3edd48a0fb1bfe16a9bfcf6743874ae5d353a"
  license "MIT OR Apache-2.0"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cyber-rain --version")
    assert_match "Usage: cyber-rain", shell_output("#{bin}/cyber-rain --help")
  end
end
