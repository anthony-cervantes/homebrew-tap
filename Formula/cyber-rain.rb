class CyberRain < Formula
  desc "Smoother, themeable Rust terminal digital-rain visualizer"
  homepage "https://github.com/anthony-cervantes/cyber-rain"
  url "https://crates.io/api/v1/crates/cyber-rain/0.1.1/download"
  sha256 "75c86d48e978415da253387cde37561af51deb1d459e0f1237752ecf4bb134d6"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cyber-rain --version")
    assert_match "Usage: cyber-rain", shell_output("#{bin}/cyber-rain --help")
  end
end
