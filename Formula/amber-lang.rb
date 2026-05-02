class AmberLang < Formula
  desc "Programming language that compiles to Bash"
  homepage "https://amber-lang.com"
  url "https://github.com/amber-lang/amber/archive/refs/tags/0.6.0-alpha.tar.gz"
  sha256 "a9294e863f46b94624be768859210703cb664e381d2281d71c35314487eebee4"
  license "LGPL-3.0-only"
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
