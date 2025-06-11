class AmberLang < Formula
  desc "Programming language that compiles to Bash"
  homepage "https://amber-lang.com"
  url "https://github.com/amber-lang/amber/archive/refs/tags/0.4.0-alpha.tar.gz"
  sha256 "14046dd50c12c5f470177fc43029495fb8f489ba84fe301e3aada1f32493b211"
  license "GPL-3.0-only"
  head "https://github.com/amber-lang/amber.git", branch: "staging"

  depends_on "rust" => :build

  depends_on "bash"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    (testpath/"main.ab").write <<~EOF
      let name = "World"
      echo "Hello, {name}"
    EOF

    assert_equal "Hello, World\n", shell_output("#{bin}/amber main.ab")
  end
end
