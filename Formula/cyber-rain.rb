class CyberRain < Formula
  desc "Smoother, themeable Rust terminal digital-rain visualizer"
  homepage "https://github.com/anthony-cervantes/cyber-rain"
  url "https://crates.io/api/v1/crates/cyber-rain/0.2.0/download"
  sha256 "6e96993c3ec9be2c8346075b0031d0b7edddc9083386b2f4d7f03f22a4ac726a"
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
