class AmberLang < Formula
  desc "Programming language that compiles to Bash"
  homepage "https://amber-lang.com"
  url "https://github.com/amber-lang/amber/archive/refs/tags/0.5.1-alpha.tar.gz"
  sha256 "518bd183297bee542d3f269c187648349a764d13c6118706717e138d6b9af35c"
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
